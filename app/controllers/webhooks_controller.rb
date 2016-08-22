class WebhooksController < ApplicationController

  helper_method :calculate_rate, :email_count

  def index
    email_count
  end

  # POST /webhooks.json
  def create
    data = Webhook.parse_data(request.raw_post)
    stored = Webhook.store_data(data)
    render :nothing => true
  end

  def email_count
    Webhook.group(:event).count
  end

  def calculate_rate(email_type, event)
    type = Webhook.where(:emailtype => email_type)
    type_sent_count = type.where(:event => "send").count
    type_event_count = type.where(:event => event).count

    if type_sent_count != 0
      ((type_event_count.to_f / type_sent_count.to_f) * 100).round(2).to_s + "%"
    else
      return "no data yet"
    end
  end



end
