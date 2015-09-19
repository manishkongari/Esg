class ChangeDatatypeToProjects < ActiveRecord::Migration
  def change
    change_column :projects, :qcdate,  :date
    change_column :projects, :shipdate,  :date
    change_column :projects, :podate,  :date
  end
end
