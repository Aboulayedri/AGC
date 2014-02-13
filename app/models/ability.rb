class Ability
  include CanCan::Ability

  def initialize(collaborator)
    # Define abilities for the passed in user here. For example:
    #
      collaborator ||= Collaborator.new # guest user (not logged in)
      if collaborator.role == "admin"
        can :manage, :all
      elsif collaborator.role == "resp_domaine"
        can :manage, :all
      elsif collaborator.role == "manager"
        can :create, Proposal
        can :destroy, Proposal
        can :manage, Collaborator
      elsif collaborator.role == "consultant"
        can :gestion_affectations, Proposal
        can :confirmation_affectations, Proposal
        can :reserver, Proposal
        can :arriver, Proposal
        can :liberer, Proposal
        can :read, [Proposal, Domain, Project]
      elsif collaborator.role == "staffeur"
        can :manage, Proposal
        can :creer_propositions, Entity
        can :envoyer_codes_imputation, :all
        can :envoyer_rapport_hebdomadaire, :all
        can :read, :all
      end

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
