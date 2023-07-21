class FoodsController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.nal.usda.gov/fdc/v1") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["X-API-KEY"]
    end

    response = conn.get("/food/Sweet%20Potato")

    json = JSON.parse(response.body, symbolize_names: true)
    @food = json[:results].map do |food_data|
      Food.new(food_data)
    end
  end
end