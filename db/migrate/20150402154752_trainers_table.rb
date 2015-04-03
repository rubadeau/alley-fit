class TrainersTable < ActiveRecord::Migration
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :additional_info
      t.string :password_digest
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
