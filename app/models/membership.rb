class Membership

  ALL = []

  attr_reader :cost, :gym, :lifter

  def initialize(cost, gym, lifter)
    @cost = cost
    @gym = gym
    @lifter = lifter
    ALL << self
  end

  def self.all
    ALL
  end


end
