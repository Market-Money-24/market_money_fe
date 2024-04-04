require "rails_helper"

RSpec.describe "Markets Show page", type: :feature do 
	before(:each) do
		WebMock.allow_net_connect!
		markets = []
		3.times do
			markets << MarketsFacade.new.markets.sample
		end
		vendors = []
		5.times do 
			vendors << MarketVendorsFacade.new.vendors
		end

	it "displays a market's name, address, and links to each of their Vendors" do
		market = Market.all.sample

		visit market_path(market.id)

		within(".show-hdr") do 
			expect(page).to have_content(market.name)
		end

		expect(page).to have_content(market.address)
		
		all(".show-vendors").each do |vendor|
			within("#show-vendor-#{vendor.id}") do 
				expect(page).to have_link(vendor.name)
				click_link(vendor.name)
			end
			expect(current_path).to eq(vendor_path(vendor.id))
		end
	end
end