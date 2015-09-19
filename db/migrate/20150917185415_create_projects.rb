class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :projectname
      t.string :priority
      t.string :contract
      t.string :salescontact
      t.string :engineer
      t.string :podate
      t.string :buildready
      t.string :qcdate
      t.string :shipdate
      t.string :mtdr
      t.text :quicknote
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
