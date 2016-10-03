require_relative 'kata'
require 'date'

describe Product do

	before (:each) do
		#won't mock Time for now... 
		@start_time = DateTime.now
		@product = Product.new("telephone", 30)
		allow(DateTime).to receive(:now).and_return(@start_time+30)
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

	it "has a stable price if price did not change for 30 days" do
		expect(@product.price_is_stable?).to eq true
	end


end