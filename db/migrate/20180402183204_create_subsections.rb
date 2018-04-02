class CreateSubsections < ActiveRecord::Migration[5.1]
  def change
    create_table :subsections do |t|
    	t.string "name"
    	t.string "picture"

      t.timestamps
    end

  create_table :section_subsection, id: false do |t|
      t.belongs_to :section, index: true
      t.belongs_to :subsection, index: true
    end
  end
end
