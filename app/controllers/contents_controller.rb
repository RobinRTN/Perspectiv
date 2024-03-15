class ContentsController < ApplicationController

  def index
    @contents = Content.all
  end

  def show
    @content = Content.find(params[:id])
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    @content.user_id = current_user.id
    if @content.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @content = Content.find(params[:id])
    @content.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def content_params
    params.require(:content).permit(:title, :video)
  end

end
