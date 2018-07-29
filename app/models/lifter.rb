
class Lifter

  attr_accessor :name, :lift_total
  ALL = []
  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    ALL << self
  end

  def self.all
    ALL
  end

  def memberships
    Membership.all.select{|membership| membership.lifter == self}
  end

  def gyms
    memberships.map{|membership| membership.gym}
  end

  def self.average_lift
    lift_totals = self.all.map{|lifter|lifter.lift_total}
    lift_totals.inject(0){ |sum, lift_total| sum + lift_total}.to_f / lift_totals.size
  end

  def sign_up(cost, gym)
    Membership.new(self, gym, cost)
  end

  def total_cost
    costs = memberships.map{|membership| membership.cost}
    costs.inject(0){|sum, cost| sum + cost}
  end
end
