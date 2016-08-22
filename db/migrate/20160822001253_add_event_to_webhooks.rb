class AddEventToWebhooks < ActiveRecord::Migration
  def change
    add_column :webhooks, :event, :string
  end
end
