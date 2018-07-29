
class Lifter
ALL = []


  attr_reader :name, :lift_total

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    ALL << self
  end

  def self.all
    ALL
  end

  def memberships
    Membership.all.select {|membership| membership.lifter == self }
  end

  def gyms
    self.memberships.collect {|membership| membership.gym}
  end

  def self.average_lift
    all_lift_totals = Lifter.all.collect {|lifter| lifter.lift_total }
    all_lift_totals.inject {|sum, el| sum + el}.to_f / all_lift_totals.size
  end

  def sign_up(cost, gym)
    Membership.new(self, gym, cost)
  end

  def total_cost
    all_costs = self.memberships.collect {|membership| membership.cost }
    all_costs.inject {|x, y| x + y}
  end

end
