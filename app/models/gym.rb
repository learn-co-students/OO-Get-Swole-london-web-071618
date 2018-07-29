class Gym
 ALL = []

  attr_reader :name

  def initialize(name)
    @name = name
    ALL << self

  end

  def self.all
    ALL
  end

  def memberships
    Membership.all.select {|membership| membership.gym == self }
  end

  def lifters
    self.memberships.collect {|membership| membership.lifter}
  end

  def lifter_names
    lifters.collect {|lifter| lifter.name}
  end

  def lift_total_for_gym
    lift = 0
    self.lifters.each {|lifter| lift += lifter.lift_total}
    lift
  end

end
