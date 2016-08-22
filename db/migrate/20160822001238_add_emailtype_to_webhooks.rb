class AddEmailtypeToWebhooks < ActiveRecord::Migration
  def change
    add_column :webhooks, :emailtype, :string
  end
end
