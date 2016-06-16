require './enumerable'

describe ".my_each" do	
	let(:array) {[1,2,3]}
	it "returns itself" do
		expect(array.my_each{|x| x}).to eql([1,2,3])
	end

	it "works with a block" do
		new_array = []
		array.my_each{ |x| new_array << (x + 1) }
		expect(new_array).to eql([2,3,4])
	end
end


describe ".my_each_with_index" do
	let(:array) {[1,2,3]}
	it "returns itself" do 
		expect(array.my_each_with_index{}).to eql([1,2,3])
	end
	it "works with a block" do 
		new_array = []
		array.my_each_with_index{|x| new_array << (x + 1)}
		expect(new_array).to eql([2,3,4])
	end
end

describe ".my_select" do 
	let(:array) {[1,2,3]}
	it "returns array with single selected item" do 
		expect(array.my_select{|x| x == 2}).to eql([2])
	end

	it "works with multiple items" do 
		expect(array.my_select{|x| (x % 2 != 0)}).to eql([1,3])
	end

	it "works with longer arrays and a more complex block" do 
		array = [1,2,3,4,5,6,7,8,9,10,11,12]
		expect(array.my_select{|x| (x + 3) % 2 == 0 || x > 9}).to eql([1,3,5,7,9,10,11,12])
	end
end

describe ".my_all?" do 
	context "no block given" do
		let(:array) {[1,2,3,4,5]}
		it "returns true if no item is falsey" do
			expect(array.my_all?).to eql(true)
		end
		it "returns false if an item IS falsey" do 
			array[4] = nil
			expect(array.my_all?).to eql(false)
		end
	end
	context "with a block" do 
		let(:array) {[1,2,3,4,5]}
		it "returns true if all items evaluate true" do
			expect(array.my_all?{|x| x < 6}).to eql(true)
		end
		it "returns false if any item evaluates false" do 
			expect(array.my_all?{|x| x < 5 }). to eql(false)
		end
	end
end

describe ".my_any?" do 
	context "no block given" do 
		let(:array) {[nil,nil,nil,nil,"not nil"]}
		it "returns true if any item is truthy" do 
			expect(array.my_any?).to eql(true)
		end
		it "returns false if no items are truthy" do 
			array[4] = nil
			expect(array.my_any?).to eql(false)	
		end
	end
	context "with block" do 
		let(:array) {[1,2,3,4,5]}
		it "returns true if any item evals true" do 
			expect(array.my_any?{|x| x == 5}).to eql(true)
		end
		it "returns false if NO items eval true" do 
			expect(array.my_any?{|x| x == 77}).to eql(false)
		end
	end
end

describe ".my_none?" do 
	context"no block given" do
		let(:array) {[nil,nil,nil]}
		it "returns true if NONE of the items are truthy" do
			expect(array.my_none?).to eql(true)
		end
		it "returns false if ANY item is truthy" do
			array[0] = "not nil"
			expect(array.my_none?).to eql(false)
		end
	end
	context "with block" do 
		let(:array) {[1,2,3,4]}
		it "returns true if NONE of the items eval true" do
			expect(array.my_none?{ |x| x == 77}).to eql(true)
		end
		it "returns false if any of the items eval true" do
			expect(array.my_none?{|x| x == 2}).to eql(false)
		end
	end
end

describe ".my_map" do
	let(:array) {[1,2,3,4]}
	it "returns an array with each element evaluated by block" do
		expect(array.my_map{|x| x+1}).to eql([2,3,4,5])
	end
end

describe ".my_count" do
	let(:array) {[1,2,3,4]}
	context "no block given" do 
		it "returns length of array" do
			expect(array.my_count).to eql(4)
		end
	end
	context "with a block" do
		it "returns number of elements that eval true" do
			expect(array.my_count{|x| x < 3}).to eql(2)
		end
	end
end

describe ".my_inject" do
	let(:array) {[2,2,2,2]}
	context "passed a block" do
		it "returns the result of evaluating the block" do 
			expect(array.my_inject{|x,y| x + y}).to eql(8)
		end
		it "works with another block" do
			expect(array.my_inject{|x,y| x * y}).to eql(16)
		end
		it "works with yet another block" do
			expect(array.my_inject{|x,y| x + y**2}).to eql(14)
		end
	end
	context "passed a method" do 
		it "returns the correct result!" do
			expect(array.my_inject(:+)).to eql(8)
		end
	end
end
