require "rails_helper"

RSpec.describe MarketsFacade, :vcr, type: :model do 
	before(:each) do 
		@facade = MarketsFacade.new
		@market_id = 322474
	end

	describe "methods" do 
		describe "#markets" do 
			it "returns all markets in the database" do 
				expect(@facade.markets.count).to eq(846)
				expect(@facade.markets).to be_an(Array)
				expect(@facade.markets.first).to be_a(MarketPoro)
				expect(@facade.markets.first.instance_variables).to eq([:@id, :@name, :@street, :@city, :@state, :@zip])
				expect(@facade.markets.first.id).to be_a(String)
				expect(@facade.markets.first.name).to be_a(String)
				expect(@facade.markets.first.street).to be_a(String)
				expect(@facade.markets.first.city).to be_a(String)
				expect(@facade.markets.first.state).to be_a(String)
				expect(@facade.markets.first.zip).to be_a(String)
			end
		end

		describe "#market" do
			it "returns a market given a market ID" do 
				expect(@facade.market(@market_id).count).to eq(1)
				expect(@facade.market(@market_id).first.instance_variables).to eq([:@id, :@name, :@street, :@city, :@state, :@zip])
				expect(@facade.markets.first.id).to be_a(String)
				expect(@facade.markets.first.name).to be_a(String)
				expect(@facade.markets.first.street).to be_a(String)
				expect(@facade.markets.first.city).to be_a(String)
				expect(@facade.markets.first.state).to be_a(String)
				expect(@facade.markets.first.zip).to be_a(String)
			end
		end

		describe "#vendors" do 
			it "returns all the vendors at a given market" do
				vendors = @facade.vendors(@market_id)
				expect(vendors.count).to eq(35)
				expect(vendors).to be_an(Array)
				expect(vendors.first).to be_a(VendorPoro)
				expect(vendors.first.instance_variables).to eq([:@id, :@name, :@contact_name, :@phone, :@credit_accepted, :@description])
				expect(vendors.first.id).to be_a(String)
				expect(vendors.first.name).to be_a(String)
				expect(vendors.first.contact_name).to be_a(String)
				expect(vendors.first.phone).to be_a(String)
				expect(vendors.first.credit_accepted).to be_a(String)
				expect(vendors.first.description).to be_a(String)
			end
		end

		describe "#vendor" do 
			it "returns a vendor given a vendor ID" do 
				vendor = @facade.vendor(55297)
			end
		end
	end
end