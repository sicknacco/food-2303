class WelcomeController < ApplicationController
  def index
    # conn = Faraday.new(url: "https://api.nal.usda.gov") do |faraday|
    #   faraday.headers["X-API-KEY"] = ENV["PROPUBLICA_API_KEY"]
    # end

    # response = conn.get("/congress/v1/members/house/#{state}/current.json")

    # json = JSON.parse(response.body, symbolize_names: true)
    # @members = json[:results].map do |member_data|
    #   Member.new(member_data)
    # end
  end
end
