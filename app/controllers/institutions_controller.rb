class InstitutionsController < ApplicationController
  def show
    @institution = Institution.find(params[:id])
    @mentors = @institution.users

    @educations = Education.all.where(institution_id: @institution.id)
    # find all user.mentor which belong to institution
    # trouver XP depuis instituion
  end
end
