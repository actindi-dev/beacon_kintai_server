class CreateWorkingDays < ActiveRecord::Migration
  def change
    create_table :working_days do |t|
      t.date :worked_on
      t.references :user, index: true
      t.integer :status
      t.references :working_activity, index: true
      t.references :leaving_activity, index: true

      t.timestamps
    end

    add_index :working_days, [:user_id, :worked_on], unique: true # 効いてるのか謎
  end
end
