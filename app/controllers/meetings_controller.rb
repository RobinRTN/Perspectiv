class MeetingsController < ApplicationController

  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @mentor = @meeting.mentor
    @meeting.status = "pending"
    @meeting.student = current_user
    @meeting.save
    @conversation = Conversation.find_by(student: current_user, mentor: @mentor)
    @message = Message.new(content: "🟡 Proposition de créneau d'échange envoyée à #{@mentor.first_name} le #{@meeting.starting.strftime('%e')}/#{@meeting.starting.strftime('%m')} à #{@meeting.starting.strftime('%l')}:#{@meeting.starting.strftime('%M')}, en attente de confirmation", meeting: @meeting)
    @message.conversation = @conversation
    @message.save
    ConversationChannel.broadcast_to(
      @conversation,
      render_to_string(partial: "messages/schedule", locals: { message: @message })

    )
    redirect_to mentor_path(@mentor)
    flash.alert = "Demande envoyée !"
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.update(meeting_params)
    redirect_to dashboard_path
  end

  def accept
    @meeting = Meeting.find(params[:id])
    @conversation = Conversation.find_by(student: @meeting.student, mentor: current_user)
    @mentor = @meeting.mentor
    @meeting.update(status: "accepted")
    @message = Message.new(content: "🟢 Proposition de créneau avec #{@mentor.first_name} le #{@meeting.starting.strftime('%e')}/#{@meeting.starting.strftime('%m')} à #{@meeting.starting.strftime('%l')}:#{@meeting.starting.strftime('%M')} acceptée !", meeting: @meeting)
    @message.conversation = @conversation
    @message.save
    ConversationChannel.broadcast_to(
      @conversation,
      render_to_string(partial: "messages/schedule", locals: {message: @message}),
    )
    redirect_to dashboard_path
  end

  def refuse
    @meeting = Meeting.find(params[:id])
    @conversation = Conversation.find_by(student: @meeting.student, mentor: current_user)
    @mentor = @meeting.mentor
    @meeting.update(status: "refused")
    @message = Message.new(content: "🔴 Proposition de créneau avec #{@mentor.first_name} le #{@meeting.starting.strftime('%e')}/#{@meeting.starting.strftime('%m')} à #{@meeting.starting.strftime('%l')}:#{@meeting.starting.strftime('%M')} refusée !", meeting: @meeting)
    @message.conversation = @conversation
    @message.save
    ConversationChannel.broadcast_to(
      @conversation,
      render_to_string(partial: "messages/schedule", locals: { message: @message })
    )
    redirect_to dashboard_path
  end

  def cancel
    @meeting = Meeting.find(params[:id])
    @conversation = Conversation.find_by(student: @meeting.student, mentor: current_user)
    @mentor = @meeting.mentor
    @meeting.update(status: "cancelled")
    @message = Message.new(content: "🔴 Créneau avec #{@mentor.first_name} le #{@meeting.starting.strftime('%e')}/#{@meeting.starting.strftime('%m')} à #{@meeting.starting.strftime('%l')}:#{@meeting.starting.strftime('%M')} annulé !", meeting: @meeting)
    @message.conversation = @conversation
    @message.save
    ConversationChannel.broadcast_to(
      @conversation,
      render_to_string(partial: "messages/schedule", locals: {message: @message})
    )
    redirect_to dashboard_path
  end

  private

  def meeting_params
    params.require(:meeting).permit(:starting, :ending, :mentor_id)
  end
end
