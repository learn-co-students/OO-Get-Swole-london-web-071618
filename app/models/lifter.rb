
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
      Membership.all.select {|membership| membership.lifter == self}
  end

  def gyms
    memberships = Membership.all.select {|membership| membership.lifter == self}
    memberships.map {|membership| membership.gym}
  end

  def self.avg_lift_total
      total = 0
      Lifter.all.each {|lifter| total = total + lifter.lift_total}
      total/ (Lifter.all.size)
  end

  def total_cost
    memberships = Membership.all.select {|membership| membership.lifter == self}
    total_cost = 0
    memberships.each {|membership| total_cost += membership.cost}
    total_cost
  end

  def add_membership(cost, gym)
    Membership.new(cost, gym, self)
  end


end
