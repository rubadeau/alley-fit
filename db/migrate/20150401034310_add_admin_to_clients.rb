class AddAdminToClients < ActiveRecord::Migration
  def change
    add_column :clients, :admin, :boolean
  end
end
