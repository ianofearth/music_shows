require('spec_helper')

describe(Band) do
	it { should have_and_belong_to_many(:venues) }

	describe("validation") do

		it("validates the presence of a band name") do
			band = Band.new({:name => ""})
			expect(band.save()).to(eq(false))
		end
	end

	describe("#title_case") do
		it("will title case band names, excliuding special words") do
			band = Band.new(:name => "ian and the stooges")
			band.save()
			expect(band.name()).to(eq("Ian and the Stooges"))
		end

		it("will always capitalize the first word regardless of wether or not it is a special word") do
			band = Band.new(:name => "the stooges, featuring ian")
			band.save()
			expect(band.name()).to(eq("The Stooges, Featuring Ian"))
		end
	end

end