class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # @mentors = User.mentor
    # @contents = Content.all
    if user_signed_in?
      @student_tags = current_user.tags.pluck(:name) # si c'est un student
      sql_query_mentors = 'experiences.sector IN (:tags) OR experiences.industry IN (:tags)'
      # sql_query_mentors = 'experiences.sector IN (:tags) OR experiences.industry IN (:tags) OR experiences.position IN (:tags) OR educations.field IN (:tags)'
      @custom_mentors = User.mentor.joins(:experiences).where(sql_query_mentors, tags: @student_tags).uniq
      # @custom_mentors = [User.find_by(last_name: "Portier"), User.find_by(last_name: "Michel"), User.find_by(last_name: "Miko"), User.find_by(last_name: "Jahier")]
      @custom_contents = Content.where(user: @custom_mentors)
      # @custom_institutions = Institution.includes(:educations, :users).where(educations: { user: @custom_mentors }).uniq
    end
  end

  def dashboard
    @user = current_user
    user_conversations
    upcoming_user_meetings
    past_user_meetings
    current_conversation
    @message = Message.new
  end

  def student_infos
  end

  private

  def user_conversations
    if current_user.status == "student"
      conversations = current_user.conversations_as_student
    else
      conversations = current_user.conversations_as_mentor
    end
    @conversations = conversations.reject { |conversation| conversation.messages.empty? }
  end

  def upcoming_user_meetings
    if current_user.status == "student"
      upcoming_meetings = current_user.meetings_as_student
    else
      upcoming_meetings = current_user.meetings_as_mentor
    end
    @upcoming_meetings = upcoming_meetings.select { |meeting| meeting.starting > Date.today }
  end

  def past_user_meetings
    if current_user.status == "student"
      past_meetings = current_user.meetings_as_student
    else
      past_meetings = current_user.meetings_as_mentor
    end
    @past_meetings = past_meetings.select { |meeting| meeting.starting < Date.today }
  end

  def current_conversation
    @conversation = user_conversations.first
  end
end
