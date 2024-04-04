require "rails_helper"

RSpec.describe "Markets Show page", type: :feature do 
	before(:each) do
		WebMock.allow_net_connect!
		@markets = []

		3.times do
			@markets << MarketsFacade.new.markets.sample
		end
	end
	it "displays a market's name and address" do
		visit market_path

		within(".show-hdr") do 
			expect(page).to have_content(market.name)
		end
		expect(page).to have_content(market.address)
	end

	it "displays a list of market vendors" do
		market = @markets.sample

		visit market_vendors_path(market.id)

		all(".show-vendors").each do |vendor|
			within("#show-vendor-#{vendor.id}") do 
				expect(page).to have_link(vendor.name)
				click_link(vendor.name)
			end
			expect(current_path).to eq(vendor_path(vendor.id))
		end
	end
end