class CollaboratorMailer < ActionMailer::Base
  default from: "Olivier Rabilloud <olivier.rabilloud@devoteam.com>"

  def envoyer_codes_imputation(proposition)
    @consultant = proposition.consultant
    @projet     = proposition.project
    mail(to: "#{@consultant.name} <#{@consultant.email}>", subject: "DRI : Codes ARAMIS")
  end

  def envoyer_rapport_hebdomadaire(entity)
    @manager = entity.manager

    propositions_valides = Proposal.where(entity_id: entity.id, etat: "validée", date: Time.now.next_week.all_week)
    @reconduits = []
    @changement_projet = []
    @revenus = []
    @nouveaux = []
    propositions.each do |proposition_valide|
      if Proposal.where(consultant_id: proposition_valide.consultant_id, project_id: proposition_valide.project_id, etat: "arrivée", date: Time.now.all_week).any?
        @reconduits << proposition_valide
      elsif 
    end
  end
end
