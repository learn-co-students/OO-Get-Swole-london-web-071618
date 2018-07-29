class Gym
 ALL = []

  attr_accessor :name

      def initialize(name)
        @name = name
        ALL << self

      end

      def self.all
        ALL
      end

      def memberships
        Membership.all.select {|membership| membership.gym == self}
      end

      def lifters
          memberships.map {|membership| membership.lifter}
      end

      def lifter_names
          lifters.map {|lifter| lifter.name}
      end

      def lift_total_for_gym
          lift_total = 0
          lifters.each {|lifter| lift_total += lifter.lift_total}
          lift_total
      end

end
