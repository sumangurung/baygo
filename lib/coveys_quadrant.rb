module SumanGurung
  module CoveysQuadrant
    def self.included(base)
      base.extend(SingletonMethods)
    end

    module SingletonMethods
      def acts_as_coveys_quadrant
        extend ClassMethods
        include InstanceMethods
      end
    end


    module ClassMethods
      def method_missing(meth, *args, &block)
        if meth =~ /^items_in_quadrant_([1-4])$/
          case $1.to_i
          when 1
            where(:important => true, :urgent => true)
          when 2
            where(:important => true, :urgent => false)
          when 3
            where(:important => false, :urgent => true)
          when 4
            where(:important => false, :urgent => false)
          end
        else
          super(meth, *args, &block)
        end
      end
    end

    module InstanceMethods
    end
  end
end
