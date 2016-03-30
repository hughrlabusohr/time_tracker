class AddDetailsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :allowed_hours, :decimal
  end
end
