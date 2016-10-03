
class Product 
	def initialize(name, price)
		@name = name
		@price = price
		@reduction = 0
	end

	def reduce_price(reduction)
		@reduction = reduction
	end

	def is_promoted?
		@reduction > 0.05 && @reduction < 0.30
	end

end