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
			venue = Venue.new(:name => "worst of the worst venue")
			venue.save()
			expect(venue.name()).to(eq("Worst of the Worst Venue"))
		end

		it("will always capitalize the first word regardless of wether or not it is a special word") do
			venue = Venue.new(:name => "the worst venue of all the venues")
			venue.save()
			expect(venue.name()).to(eq("The Worst Venue of all the Venues"))
		end

	end
	
end