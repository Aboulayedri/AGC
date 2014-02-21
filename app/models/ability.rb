class Ability
  include CanCan::Ability

  def initialize(collaborator)
    # Define abilities for the passed in user here. For example:
    #
      collaborator ||= Collaborator.new # guest user (not logged in)
      if collaborator.role == "admin"
        can :manage, :all
      elsif collaborator.role == "manager_dri"
        can :manage, :all
      elsif collaborator.role == "resp_domaine"
        can :manage, Domain, responsable_id: collaborator.id
        cannot :create, Domain
        can :manage, Project, domain: {responsable_id: collaborator.id}
        can :read, Collaborator
        can :gestion_affectations, Proposal
        can :confirmation_affectations, Proposal
        cannot :valider, Proposal
        cannot :liberer, Proposal
        cannot :arriver, Proposal
        can :reserver, Proposal
        can :liberer, Proposal do |proposal|
          proposal.project.domain.responsable_id == collaborator.id
        end
        can :arriver, Proposal do |proposal|
          proposal.project.domain.responsable_id == collaborator.id
        end
      elsif collaborator.role == "manager_dvt"
        can :manage, Entity, manager_id: collaborator.id
        cannot :create, Entity
        can :manage, Proposal, entity: {manager_id: collaborator.id}
        cannot :gestion_affectations, Proposal
        cannot :confirmation_affectations, Proposal
        cannot :publier, Proposal
        can :manage, Collaborator, entity: {manager_id: collaborator.id}
      elsif collaborator.role == "consultant" and Project.where(chef_id: collaborator.id).any? or Project.where(maitrise_ouvrage_id: collaborator.id).any?
        can :read, Collaborator
        can :gestion_affectations, Proposal
        can :confirmation_affectations, Proposal
        can :reserver, Proposal
        can :arriver, Proposal, project: { chef_id: collaborator.id }
        can :read, Proposal, project: { chef_id: collaborator.id }
        cannot :index, Proposal
        cannot :valider, Proposal
        cannot :liberer, Proposal
        can :liberer, Proposal, project: { chef_id: collaborator.id }
        can :read, Domain # do |domain|
          # Project.where(domain_id: domain.id, chef_id: collaborator.id).any?
        # end
        can :read, Project, chef_id: collaborator.id
        can :read, Project, maitrise_ouvrage_id: collaborator.id
      elsif collaborator.role == "staffeur"
        can :manage, Proposal
        can :creer_propositions, Entity
        can :envoyer_codes_imputation, :all
        can :envoyer_rapport_hebdomadaire, :all
        can :manage, Collaborator
        can :read, :all
      end
      
      cannot :destroy, [Collaborator, Project, Domain, ProjectCode, AramisEntity, Entity]
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
