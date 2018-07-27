class Gym
 @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self

  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.select {|x| x.gym == self}
  end

  def lifters
    self.memberships.map {|x| x.lifter}
  end

  def lifter_names
    self.lifters.map{|x| x.name}
  end

  def lift_total_for_gym
    total = self.lifters.map {|x| x.lift_total}
    total.inject(:+)
  end

end
