require 'rails_helper'

RSpec.describe "Welcome Page Search", type: :feature do
  describe "visiting root path '/" do
    it "has a search form" do
      visit '/'
      
      fill_in "q", with: "sweet potatoes"
      click_button "Search"

      expect(current_path).to eq(foods_path)
      expect(page).to have_content("Total Results: > 30,000")
      expect(page).to have_content("Food with Sweet Potato", count: 10)
      expect(page).to have_content("GTIN/UPC code:")
      expect(page).to have_content("Description:")
      expect(page).to have_content("Brand Owner:")
      expect(page).to have_content("Ingredients:")
    end
  end
end