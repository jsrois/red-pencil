require_relative 'kata'

describe Product do

	before (:each) do
		@product = Product.new("telephone", 30)
	end 

	it "does not promote with original price" do
		expect(@product.is_promoted?).to eq false
	end

	it "gets promoted with prize reduction between boundaries" do
		@product.reduce_price(0.20)
		expect(@product.is_promoted?).to eq true
	end

	it "does not promote with reduction out of boundaries" do
		@product.reduce_price(0.5) # other cases?
		expect(@product.is_promoted?).to eq false
		@product.reduce_price(0.01) # other cases?
		expect(@product.is_promoted?).to eq false
	end
end