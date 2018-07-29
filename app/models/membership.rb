class Membership

  attr_accessor :cost, :lifter, :gym
  ALL = []
  def initialize(lifter, gym, cost)
    @cost = cost
    @lifter = lifter
    @gym = gym
    ALL << self
  end

  def self.all
    ALL
  end

end
