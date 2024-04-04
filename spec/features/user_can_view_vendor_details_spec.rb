require "rails_helper"

RSpec.describe "Vendor Show page", type: :feature do 
	before(:each) do 
		WebMock.allow_net_connect!
	end

	it "displays a vendor's contact info" do 
		vendor_id = 54924
		visit vendor_path(vendor_id)

		within(".vendor-hdr") do 
			expect(page).to have_content("CHZ PLZ")
		end

		within(".vendor-contact") do
			expect(page).to have_content("Verna Goodwin Ret.")
			expect(page).to have_content("595-100-6344")
			expect(page).to have_content("This vendor offers a variety of artisanal cheeses.")
		end
	end
end 