require 'sqlite3'
require 'rubygems'
require 'test/unit'
require 'active_record'
require 'active_support'
require 'active_record/fixtures'
require 'active_support/test_case'

# ActiveSupport::TestCase.fixture_path = File.dirname(__FILE__) + "/fixtures/"
# $LOAD_PATH.unshift(ActiveSupport::TestCase.fixture_path)

def load_schema
  config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
  
  ActiveRecord::Base.establish_connection(config["sqlite3"])
  load File.dirname(__FILE__) + "/schema.rb"
  require File.dirname(__FILE__) + '/../rails/init'
  
  License.setup_licenses
end