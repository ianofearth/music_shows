require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("adding a new venue", {:type => :feature}) do
	it("allows a user to add a new venue to the list of venues") do
		visit("/")
		click_link("View All Venues")
		fill_in("name", :with => "Ian's House")
		click_button("Add Venue")
		expect(page).to have_content("Ian's House")
	end
end

describe("viewing an individual venue", :type => :feature) do
	it("allows users to view an individual venue") do
		venue = Venue.create({:name => "Ian's Place"})
		visit("/venues")
		click_link("Ian's Place")
		expect(page).to have_content("Ian's Place")
	end
end

describe("adding a new band", {:type => :feature}) do
	it("allows a user to add a new band to the list of bands") do
		visit("/")
		click_link("View All Bands")
		fill_in("name", :with => "Ian and the Stooges")
		click_button("Add Band")
		expect(page).to have_content("Ian and the Stooges")
	end
end

describe("viewing an individual band", :type => :feature) do
	it("allows users to view an individual venue") do
		band = Band.create({:name => "Ian and the Stooges"})
		visit("/bands")
		click_link("Ian and the Stooges")
		expect(page).to have_content("Ian and the Stooges")
	end
end

describe("updating a band name", :type => :feature) do
	it("allows a user to update a bands name") do
		band = Band.create({:name => "Ian and the Stooges"})
		visit("/bands")
		select("Ian and the stooges", :from => "band_select")
		fill_in("name_update", :with => "The Stooges, Featuring Ian")
		click_botton("Update Band")
		expect(page).to have_content("The Stooges, Featuring Ian")
	end
end
