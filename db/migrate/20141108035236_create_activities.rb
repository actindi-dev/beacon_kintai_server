class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :working_day, index: true
      t.integer :status

      t.timestamps
    end
  end
end
