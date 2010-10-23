require "active_record"
require "action_view"

require "acts_as_licensable/acts_as_licensable"
require "acts_as_licensable/license"
require "acts_as_licensable/licensing"
require "acts_as_licensable/acts_as_licensable_helper"

LICENSE_KIND_CODE = 1
LICENSE_KIND_CONTENT = 2
LICENSE_KIND_OTHER = 3


if defined?(ActiveRecord::Base)
  ActiveRecord::Base.send :include, ActsAsLicensable::Licensable
end

if defined?(ActionView::Base)
  ActionView::Base.send :include, ActsAsLicensable::Helper
end
