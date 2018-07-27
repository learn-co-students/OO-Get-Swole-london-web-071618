
class Lifter

  attr_reader :name, :lift_total

  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select {|x| x.lifter == self}
  end

  def gyms
    self.memberships.map {|x| x.gym}
  end

  def self.average_lift
    lifts = self.all.map {|x| x.lift_total}
    lifts.inject(:+)/lifts.size
  end

  def sign_up(cost, gym)
    Membership.new(self, gym, cost)
  end

  def total_cost
    costs = self.memberships.map {|x| x.cost}
    costs.inject(:+)
  end


end
