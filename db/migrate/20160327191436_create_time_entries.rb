class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.integer :project_id
      t.integer :developer_id
      t.decimal :duration
      t.date :date

      t.timestamps null: false
    end
  end
end
