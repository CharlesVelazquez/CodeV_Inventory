class CreateContainers < ActiveRecord::Migration[5.1]
  def change
    create_table :containers do |t|
    	t.string "name"
    	t.string "picture"

      t.timestamps
    end

  create_table :containers_subsections, id: false do |t|
      t.belongs_to :subsection, index: true
      t.belongs_to :container, index: true
    end
  end

end
