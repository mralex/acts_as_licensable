module ActsAsLicensable
  module Licensable
    def self.included(base)
      base.send :extend, ClassMethods
    end
    
    module ClassMethods
      ##
      # Makes a model licensable
      #
      # Example:
      #    class Book < ActiveRecord::Base
      #      acts_as_licensable
      #    end
      def acts_as_licensable(options = {})
        class_eval do
          has_one :licensing, :dependent => :destroy, :include => :license
          has_one :license, :through => :licensing
        end
        
        send :include, InstanceMethods
      end
    end
    
    module InstanceMethods
      
    end
  end
end
