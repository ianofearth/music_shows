require('spec_helper')

describe(Venue) do
	it { should have_and_belong_to_many(:bands)}

	describe("validation") do

		it("validates the presence of a vanue name") do
			venue = Venue.new({:name => ""})
			expect(venue.save()).to(eq(false))
		end
	end

	describe("#title_case") do
		it("will title case venue names, excliuding special words") do
			venue = Venue.new(:name => "ian and the stooges")
			venue.save()
			expect(venue.name()).to(eq("Ian and the Stooges"))
		end
	end
	
end