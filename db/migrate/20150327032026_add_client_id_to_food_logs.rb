class AddClientIdToFoodLogs < ActiveRecord::Migration
  def change
    add_column :food_logs, :client_id, :integer

  end
end
