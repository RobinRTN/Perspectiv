class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:update, :destroy]

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user_id = current_user.id
    if @experience.save
      redirect_to "/users/sign_up"
    else
      flash.alert = "Tous les champs doivent être complétés 🛠️"
    end
  end

  def update
    @experience.update(experience_params)
    redirect_to dashboard_path
  end

  def destroy
    @experience.destroy
  end

  private

  def experience_params
    params.require(:experience).permit(:start_date, :end_date, :position, :sector, :industry, :company)
  end

  def set_experience
    @experience = Experience.find(params[:id])
  end
end
