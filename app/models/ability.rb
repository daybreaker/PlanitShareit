class Ability
	include CanCan::Ability

	def initialize(user)
		can :view, Trip, :user_id => user.id
		can :edit, Trip, :user_id => user.id
		can :view, Event, :trip => {:user_id => user.id}
		can :create, Event, :trip => {:user_id => user.id}
		can :edit, Event, :trip => {:user_id => user.id}
	end
end

