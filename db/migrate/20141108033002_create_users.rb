class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password, null: false # FIXME

      t.timestamps
    end
  end
end
