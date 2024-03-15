class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :redirect_if_incomplete_user, unless: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: user_params)
    devise_parameter_sanitizer.permit(:sign_in, keys: user_params)
    devise_parameter_sanitizer.permit(:account_update, keys: user_params)
  end

  def user_params
    %i[first_name last_name description status age]
  end

  def redirect_if_incomplete_user
    return if user_signed_in? && current_user.complete? || current_user&.mentor?
    return if params[:controller] == 'pages' && params[:action] == 'student_infos'
    return if params[:controller] == 'preferences' && params[:action] == 'create'
    return if params[:controller] == 'pages' && params[:action] == 'home' && !user_signed_in?

    redirect_to student_infos_path
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
