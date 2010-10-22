require "active_record"

require "acts_as_licensable/acts_as_licensable"
require "acts_as_licensable/license"
require "acts_as_licensable/licensing"

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend ActsAsLicensable::Licensable
end
