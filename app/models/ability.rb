class Ability
  #include CanCan::Ability
  #def initialize(user)
   # if user.admin
    #  can :manage, :all
    #else
     # can [:new], Choice
      #can [:classificacao], Enquete
    #end
  #end
end