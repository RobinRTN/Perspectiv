class PreferencesController < ApplicationController

  def create
    tags = params[:preference][:tag_id]
    tags.each do |tag|
      pref = Preference.new
      pref.tag_id = Tag.find_by(name: tag).id
      pref.user_id = current_user.id
      pref.save
    end
    redirect_to root_path
  end

end
