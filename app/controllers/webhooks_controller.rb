class WebhooksController < ApplicationController
  
  def index
  end

  # POST /webhooks.json
  def create
    information = request.raw_post
    data_parsed = JSON.parse(information)
    p data_parsed

    render json: data_parsed
  end

end
