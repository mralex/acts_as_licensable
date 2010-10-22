class ActsAsLicensableMigration < ActiveRecord::Migration
  def self.up
    create_table :licenses do |t|
    end
    
    create_table :licensed do |t|
      
    end
  end
  
  def self.down
    drop_table :licensed
    drop_table :licenses
  end
end
