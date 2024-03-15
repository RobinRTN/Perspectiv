class EducationsController < ApplicationController
  def new
    @institutions = Institution.all
    @education = Education.new
  end

  def create
    @education = Education.new(education_params)
    @education.user_id = current_user.id
    if @education.save
      redirect_to edit_user_registration_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def education_params
    params.require(:education).permit(:start_date, :end_date, :degree_level, :field, :institution_id)
  end
end
