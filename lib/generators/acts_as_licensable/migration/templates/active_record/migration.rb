class ActsAsLicensableMigration < ActiveRecord::Migration
  def self.up
    create_table :licenses do |t|
      # "GNU Public License", "Creative Commons Attribution"
      t.string  :name
      
      # "GPL", "CC-BY"
      t.string  :short_name
      
      t.string  :version
      t.string  :url
      
      # CODE_LICENSE; CONTENT_LICENSE; CC_LICENSE; OTHER_LICENSE (incl. public domain)
      t.integer :kind

      t.text    :description

      t.timestamps
    end
    
    create_table :licensings do |t|
      t.references :license
      t.references :licensable, :polymorphic => true
      
      t.datetime :created_at
    end
  end
  
  def self.down
    drop_table :licensings
    drop_table :licenses
  end
end
