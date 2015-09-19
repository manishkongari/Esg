class ChangeDatatypeToProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :qcdate
    remove_column :projects, :shipdate
    remove_column :projects, :podate
    add_column :projects, :qcdate, :date
    add_column :projects, :shipdate, :date
    add_column :projects, :podate, :date
  end

  def down

  end
end
