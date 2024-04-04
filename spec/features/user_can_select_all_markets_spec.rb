require "rails_helper"

RSpec.describe "Markets Index page", type: :feature do 
	it "displays all the markets in the database, with their name, city, state, and a button with 'more info' on each market" do 
		visit markets_path
		
		within(first(".market")) do 
			expect(page).to have_content("14&U Farmers' Market")
			expect(page).to have_content("Washington")
			expect(page).to have_content("District of Columbia")
			
			expect(page).to have_css(".name")
			expect(page).to have_css(".city")
			expect(page).to have_css(".state")
			# expect(page).to have_css(".more-info")
		end
	end
end 