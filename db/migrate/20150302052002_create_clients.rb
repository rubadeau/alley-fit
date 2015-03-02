class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :client_id
      t.string :name
      t.string :phone
      t.string :email
      t.string :member_id
      t.datetime :date_of_birth
      t.string :emergency_contact
      t.string :emergency_number
      t.text :additional_info

      t.timestamps null: false
    end
  end
end
