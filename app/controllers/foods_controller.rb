class FoodsController < ApplicationController
  def index
    conn = Faraday.new(url: "https://api.nal.usda.gov/fdc/v1") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["X-API-KEY"]
    end

    response = conn.get("/foods/search?query=sweet%20potato&dataType=&pageSize=10&sortOrder=asc")
    json = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
    @food = json[:results].map do |food_data|
      Food.new(food_data)
    end
  end
end