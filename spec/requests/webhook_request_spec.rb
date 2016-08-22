require "rails_helper"

RSpec.describe "JSON Requests", :type => :request do

  it "responds to a JSON request" do
    headers = { "CONTENT_TYPE" => "application/json" }
    post "/webhooks.json", '{"Address":"rehat@lostmy.name","EmailType":"GetABookDiscount","Event":"send","Timestamp":1471821010}', headers
    expect(request.content_type).to eq("application/json")
    expect(response).to have_http_status(200)
  end

end
