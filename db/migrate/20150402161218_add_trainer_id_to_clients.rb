class AddTrainerIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :trainer_id, :integer
  end
end
