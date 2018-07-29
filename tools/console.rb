require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


sarah = Lifter.new("sarah", 120)
maduri = Lifter.new("maduri", 50)
ali = Lifter.new("ali", 90)

gym1 = Gym.new("gym1")
gym2 = Gym.new("gym2")
gym3 = Gym.new("gym3")
gym4 = Gym.new("gym4")

membership1 = Membership.new(120, gym1, sarah)
membership2 = Membership.new(150, gym2, maduri)
membership3 = Membership.new(100, gym3, ali)
membership2 = Membership.new(50, gym1, ali)



binding.pry
