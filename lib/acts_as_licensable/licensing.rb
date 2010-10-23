class Licensing < ActiveRecord::Base #:nodoc:
  belongs_to :license
  belongs_to :licensable, :polymorphic => true

  validates_presence_of :license_id

  validates_uniqueness_of :license_id, :scope => :licensable_id
end
