class AddTimestampToWebhooks < ActiveRecord::Migration
  def change
    add_column :webhooks, :timestamp, :integer
  end
end
