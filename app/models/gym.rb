class Gym
 ALL = []

  attr_reader :name

      def initialize(name)
        @name = name
        ALL << self

      end

      def self.all
        ALL
      end


      def all_memberships
        Membership.all.select {|membership| membership.gym == self}
      end

      def all_lifters
        all_memberships.map {|membership| membership.lifter}
      end

      def all_lifters_names
        all_lifters.map {|lifter| lifter.name}
      end

      def lift_total
        lift_total = 0
        all_lifters.each {|lifter| lift_total += lifter.lift_total}
        lift_total
      end

end
