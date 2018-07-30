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
    Membership.all.select {|m| m.gym == self}
  end

  def lifters
    memberships.map {|l| l.cost}
  end

  def lifter_names
    lifters.map {|n| n.name}
  end

  def lift_total_for_gym
    total = lifters.map {|t| t.lift_total}
    total.inject(0) {|sum,x| sum+x}
  end


end
