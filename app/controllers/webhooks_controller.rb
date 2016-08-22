class WebhooksController < ApplicationController

  def index
  end

  # POST /webhooks.json
  def create
    data = Webhook.parse_data(request.raw_post)
    stored = Webhook.store_data(data)
    render :nothing => true
  end

end
