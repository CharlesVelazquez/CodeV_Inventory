class CreateContainers < ActiveRecord::Migration[5.1]
  def change
    create_table :containers do |t|
    	t.string "name"
    	t.string "picture"

      t.timestamps
    end

  create_table :subsection_container, id: false do |t|
      t.belongs_to :subection, index: true
      t.belongs_to :container, index: true
    end
  end

end
