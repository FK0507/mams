class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new  # ログインしていない場合は、からユーザーを用意し判定に用いる

  # default parmission
    cannot :manage, :all
    can [:new, :create, :edit, :update], User
    can :manage, Relationship
    can :read , Industry

    if user.kind == "sys"
      can :manage, :all
      if user.role == "member"
        cannot :manage, User, kind: "sys"
        can :manage, User, role: "supporter"
      elsif user.role == "supporter"
        cannot :manage, :all
        can :read, :all  #全て参照できるか、要テスト
      end
    end
    
    if user.kind == "seller"
      can [:new, :index, :create], Seller
      can :manage , Seller, created_by: user.id
      can [:read, :update] , Buyer
      can :manage, User
      can :manage , :invitation
      if user.role == "member"
        can :manage, Seller , created_by: user.invited_by_id
        cannot [:new, :create], Seller , created_by: user.invited_by_id
#        cannot :manage, :invitation
      elsif user.role == "supporter"
        can :manage, Seller , created_by: user.invited_by_id
        cannot [:new, :create], Seller , created_by: user.invited_by_id
#        cannot :manage, :invitation
      end
    end
      
    if user.kind == "buyer"
      can [:new, :index, :create], Buyer
      can :manage , Buyer, created_by: user.id
      can :read , Seller
      can :manage, User
      if user.role == "member"
        can [:read, :update, :destroy], Buyer , created_by: user.invited_by_id
        cannot :invite, User
      elsif user.role == "supporter"
        can [:read, :update, :destroy], Buyer , created_by: user.invited_by_id
        cannot :invite, User
      end
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
