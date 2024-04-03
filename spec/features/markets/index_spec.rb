require "rails_helper"

RSpec.describe "Markets Index page", type: :feature do 
	it "displays all the markets in the database, with their name, city, state, and a button with 'more info' on each market" do 
		visit markets_path
		
		all(".index-markets").each do |market|
			expect(page).to have_content(market.name)
			expect(page).to have_content(market.city)
			expect(page).to have_content(market.state)

			within("#index-market-#{market.id}") do 
				expect(page).to have_button("More Info")
				click_button "More Info"
				expect(current_path).to eq(market_path(market.id))
			end
		end
	end
end 