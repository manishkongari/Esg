class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :ctype
      t.string :partno
      t.text :desc
      t.string :manuf
      t.string :qty
      t.integer :project_id
      t.integer :component_type_id

      t.timestamps null: false
    end
  end
end
