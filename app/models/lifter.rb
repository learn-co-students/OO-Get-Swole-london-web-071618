
class Lifter

  attr_accessor :name, :lift_total


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
      Membership.all.select {|membership| membership.lifter == self}
  end

  def gyms
    memberships.map {|membership| membership.gym}
  end

  def self.average_lift
      total = 0
      Lifter.all.each {|lifter| total += lifter.lift_total}
      total/ (Lifter.all.size)
  end

  def total_cost
      memberships = Membership.all.select {|membership| membership.lifter == self}
      total_cost = 0
      memberships.each {|membership| total_cost += membership.cost}
      return total_cost
  end

  def sign_up(cost, gym)
    Membership.new(self, gym, cost)
  end


end
