module ActsAsLicensable
  module Licensable
    
    ##
    # Makes a model licensable
    #
    # Example:
    #    class Book < ActiveRecord::Base
    #      acts_as_licensable
    #    end
    def acts_as_licensable
      class_eval do
        has_one :licensing, :dependent => :destroy, :include => :license
        has_one :license, :through => :licensing
      end
    end
  end
end