class CollaboratorMailer < ActionMailer::Base
  default from: "Olivier Rabilloud <olivier.rabilloud@devoteam.com>"

  def envoyer_codes_imputation(proposition)
    @consultant = proposition.consultant
    @projet     = proposition.project
    mail(to: "#{@consultant.name} <#{@consultant.email}>", subject: "DRI : Codes ARAMIS")
  end

  def prevenir_responsable(domain)
    @responsable = domain.responsable
    mail(to: "#{@responsable.name} <#{@responsable.email}>", subject: "Ouverture des sélections")
  end

  def envoyer_rapport_hebdomadaire(entity)
    @entity = entity
    @manager = entity.manager

    @reconduits = []
    @changement_projet = []
    @revenus = []
    @nouveaux = []
    propositions_valides = Proposal.where(entity_id: entity.id, etat: "validée", date: Time.now.next_week.all_week)
    propositions_valides.each do |proposition_valide|
      if Proposal.where(consultant_id: proposition_valide.consultant_id, project_id: proposition_valide.project_id, etat: "arrivée", date: Time.now.all_week).any?
        @reconduits << proposition_valide
      elsif Proposal.where("consultant_id = ? and project_id != ? and etat = ? and date >= ? and date <= ?", proposition_valide.consultant_id, proposition_valide.project_id, "arrivée", Time.now.beginning_of_week, Time.now.end_of_week).any?
        @changement_projet << proposition_valide
      elsif Proposal.where("consultant_id = ? and id != ? and etat = ?", proposition_valide.consultant_id, proposition_valide.id, "arrivée").any?
        @revenus << proposition_valide
      else
        @nouveaux << proposition_valide
      end
    end

    @sortants = []
    propositions_presentes = Proposal.where(entity_id: @entity.id, etat: "arrivée", date: Time.now.all_week)
    propositions_presentes.each do |proposition|
      @sortants << proposition unless Proposal.where(consultant_id: proposition.consultant_id, date: Time.now.next_week.all_week).any?
    end

    @attentes = []
    @eligibilite_conditionnelle = []
    propositions = Proposal.where(entity_id: @entity.id, etat: "disponible", date: Time.now.next_week.all_week)
    propositions.each do |proposition|
      if proposition.consultant.eligibilite == "éligible"
        @attentes << proposition
      elsif proposition.consultant.eligibilite == "éligible-conditionnelle"
        @eligibilite_conditionnelle << proposition
      end
    end

    mail(to: "#{@manager.name} <#{@manager.email}>", subject: "DRI : Rapport hebdomadaire pour #{entity.name}")
  end
end
