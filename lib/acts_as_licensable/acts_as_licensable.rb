module ActsAsLicensable
  module Licensable
    def self.included(base)
      base.extend ClassMethods
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
          has_one :licensing, :dependent => :destroy, :include => :license, :as => :licensable
          has_one :license, :through => :licensing, :as => :licensable
        end
        
        include ActsAsLicensable::Licensable::InstanceMethods
      end
    end
    
    module InstanceMethods
      def licensed?
        !license.nil?
      end
      
      def license_id=(license_id)
        self.license = License.find(license_id)
      end
      
      def license_id
        self.license.id
      end
    end
  end
end
