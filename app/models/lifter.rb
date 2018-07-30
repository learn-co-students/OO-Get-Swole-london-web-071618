
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
    Membership.all.select {|m| m.cost == self}
  end

  def gyms
    memberships.map {|g| g.gym}
  end

  def self.average_lift
    average = self.all.map {|t| t.lift_total}
    average.inject(0) {|sum,el| sum+el} / average.size
  end

  def sign_up(cost, gym)
    Membership.new(self, gym, cost)
  end

  def total_cost
      #total = memberships.map {|t| t.cost}
      #total.inject(0) {|sum,x| sum+x}
    total_cost = 0
    memberships.each do |m|
    total_cost += m.lifter
    end
   total_cost
  end

  #def total_cost
    # get the array of membership costs
    # all_costs = memberships.map{|m| m.cost}
    # sum the cost into an integer
    # all_costs.SOMEMETHODTHATSUMSUPALL {|c|fdpgiodfigo}
    # end

end
