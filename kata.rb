
require 'date'

class Product 
	def initialize(name, price)
		@name = name
		@price = price
		@reduction = 0
		@last_price_update_date = DateTime.now
	end

	def reduce_price(reduction)
		@reduction = reduction
		@last_price_update_date = DateTime.now
	end

	def reduction_is_inside_bounds?
		@reduction > 0.05 && @reduction < 0.30
	end

	def price_is_stable?
		@last_price_update_date < (DateTime.now - 30)
	end

	def is_promoted?
		reduction_is_inside_bounds? 
	end

end