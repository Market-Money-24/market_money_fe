require "rails_helper"

RSpec.describe "user can view a market's vendors", type: :feature do 
	before(:each) do 
		WebMock.allow_net_connect!
		@markets = []

		3.times do
			@markets << MarketFacade.new.markets
		end
	end

	it "a user can see all the vendors at a particular market" do 
		visit markets_path

		within(first(".market")) do
			click_clink(@markets.first.name)

			expect(current_path).to eq(market_vendors_path(@markets.first.id))

			within(first(".index-vendors")) do 
				expect(page).to have_link(@markets.first.name)
			end
		end
	end
end 