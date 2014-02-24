class ApplicationController < ActionController::Base
  before_action :authenticate_collaborator!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def after_sign_out_path_for(resource_or_scope)
    new_collaborator_session_path
  end

  # def after_sign_in_path_for(resource_or_scope)
  #   if current_collaborator.etat == "inactif"
  #     redirect_to destroy_collaborator_session_path, alert: "Vous n'êtes pas autorisé à vous connecter au site"
  #   else
  #     redirect_to root_path
  #   end
  # end

  def current_ability
    @current_ability ||= Ability.new(current_collaborator)
  end
end
