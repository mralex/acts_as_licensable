require "active_record"
require "action_view"

require "acts_as_licensable/acts_as_licensable"
require "acts_as_licensable/license"
require "acts_as_licensable/licensing"
require "acts_as_licensable/acts_as_licensable_helper"

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.send :include, ActsAsLicensable::Licensable
end

if defined?(ActionView::Base)
  ActionView::Base.send :include, ActsAsLicensable::Helper
end
