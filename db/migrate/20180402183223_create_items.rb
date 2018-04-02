class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
    	t.string "name"
    	t.string "picture"
    	t.string "description"
    	t.string "reciept_picture"

    	t.integer "qty"
    	t.integer "min"
    	t.integer "max"
    	t.integer "value"
    	t.integer "uid"
    	
    	t.datetime "obtained_date"
    	t.datetime "loaned_date"
    	
    	t.boolean "loaned"

    	t.belongs_to :user, index: true
    	t.belongs_to :storage_location, index: true
    	t.belongs_to :section, index: true
    	t.belongs_to :subsection, index: true
    	t.belongs_to :container, index: true

      t.timestamps
    end
  end
end
