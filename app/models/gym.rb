class Gym
 ALL = []

  attr_accessor :name

  def initialize(name)
    @name = name
    ALL << self
  end

  def self.all
    ALL
  end

  def memberships
    Membership.all.select {|membership| membership.gym == self}
  end

  def lifters
    memberships.map {|membership| membership.lifter}
  end

  def lifter_names
    lifters.map {|lifter| lifter.name}
  end

  def lift_total_for_gym
    total_array = lifters.map {|lifter| lifter.lift_total}
    total_array.inject(0){|sum, lift_total| sum + lift_total}
  end
end
