ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define :version => 0 do
  create_table :licenses, :force => true do |t|
     t.string  :name
     t.string  :short_name
     t.string  :version
     t.string  :url
     t.integer :kind
     t.text    :description
     t.timestamps
   end
   
   create_table :licensings, :force => true do |t|
     t.references :license
     t.references :licensable, :polymorphic => true
     t.datetime :created_at
   end
   
   create_table :books, :force => true do |t|
     t.string :title, :string
     t.string :synopsis, :text
   end
end

ActiveRecord::Migration.verbose = true
