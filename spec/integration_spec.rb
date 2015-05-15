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