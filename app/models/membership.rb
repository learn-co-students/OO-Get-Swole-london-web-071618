class Membership
ALL = []

  attr_reader :cost, :gym, :lifter

  def initialize(lifter, gym, cost)
    @lifter = lifter
    @gym = gym
    @cost = cost
    ALL << self
  end

  def self.all
    ALL
  end

end
