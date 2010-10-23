require 'test_helper'

class ActsAsLicensableTest < ActiveSupport::TestCase
  load_schema  
  require "fixtures/book"
  
  # Replace this with your real tests.
  test "there should be 16 licenses available" do
    assert_equal 16, License.all.count
  end
  
  test "new object shouldn't have a license" do
    assert_equal false, Book.new.licensed?
  end
  
  test "object should be licensed" do
    b = Book.new
    b.license = License.first
    b.save!
    
    assert_equal true, b.licensed?
  end
end
