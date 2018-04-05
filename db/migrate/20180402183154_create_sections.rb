class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
    	t.string "name"
    	t.string "picture"

      t.timestamps
    end

  create_table :sections_storage_locations, id: false do |t|
      t.belongs_to :storage_location, index: true
      t.belongs_to :section, index: true
    end
  end

end
