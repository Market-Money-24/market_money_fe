require "rails_helper"

RSpec.describe "Markets Index page", type: :feature do 
	before(:each) do 
		WebMock.allow_net_connect!
	end
	
	it "displays all the markets in the database, with their name, city, state, and a button with 'more info' on each market" do 
		visit markets_path
		
		# total # of markets
		expect(all(".name").count).to eq(846)

		# test first record
		within(first(".market")) do 
			expect(page).to have_content("14&U Farmers' Market")
			expect(page).to have_content("Washington")
			expect(page).to have_content("District of Columbia")
			
			expect(page).to have_css(".name")
			expect(page).to have_css(".city")
			expect(page).to have_css(".state")
			# 14&U Farmers' Market - always first per `order by name asc``
			expect(page).to have_css("#info-btn-322458")
		end
	end
end 