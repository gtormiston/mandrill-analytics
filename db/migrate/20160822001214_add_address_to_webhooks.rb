class AddAddressToWebhooks < ActiveRecord::Migration
  def change
    add_column :webhooks, :address, :string
  end
end
