class Webhook < ActiveRecord::Base

  def self.parse_data(data)
    parsed_data = JSON.parse(data)
  end

  def self.store_data(data)
    Webhook.create!(address: data["Address"],
                    emailtype: data["EmailType"],
                    event: data["Event"],
                    timestamp: data["Timestamp"])
  end

end
