class CreateStorageLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :storage_locations do |t|
    	t.string "name"
    	t.string "picture"
    	t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
