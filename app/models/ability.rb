class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    
    if user.role? :admin
      can :manage, :all
    elsif user.role? :course_instructor
      can :manage, [Lesson, Registration]
    elsif user.role? :student
      can :read, [Lesson, Registration]
    end
  end
end