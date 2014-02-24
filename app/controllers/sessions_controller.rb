class SessionsController < Devise::SessionsController
  def create
    collaborator = Collaborator.find_by(email: params[:collaborator][:email])
    if collaborator.etat == "inactif"
      redirect_to new_collaborator_session_path, alert: "Vous n'êtes pas autorisé(e) à vous connecter à l'application."
    else
      super
    end
  end
end
