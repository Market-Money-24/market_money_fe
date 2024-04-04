class MarketsController < ApplicationController 
	def index
		@markets = MarketsFacade.new.markets
	end

	def show
		
	end
end