class VendorsController < ApplicationController
	def show
		facade = MarketsFacade.new
		vendor_arr = facade.vendor(params[:id]) || []
		@vendor = vendor_arr.first
	end
end