require "rails_helper"

RSpec.describe "Markets Show page", type: :feature do 
	before(:each) do
		WebMock.allow_net_connect!
		@market_id = 322474
		@vendor_id = 55297
	end
	
	it "displays a market's name and address" do
		visit market_path(@market_id)

		expect(page).to have_content("2nd Street Farmers' Market")
		expect(page).to have_content("194 second street")
		expect(page).to have_content("Amherst, Virginia 24521")
	end

	it "displays a list of market vendors" do
		visit market_path(@market_id)

		expect(all(".vendor-index").count).to eq(35)

		within(first(".vendor-index")) do
			expect(page).to have_link("Orange County Olive Oil")
			click_link("Orange County Olive Oil")
		end
		expect(current_path).to eq(vendor_path(55297))
	end
end