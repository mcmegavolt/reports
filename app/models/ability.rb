class Ability
 
  include CanCan::Ability 

  def initialize (user) 
    
    user ||= User.new(:role_id => 1)

    if user.admin?
      can :manage, :all 
    else
      can :manage, Report do |report| 
        report.try (:owner) == user
      end 
    end 

  end 

end
