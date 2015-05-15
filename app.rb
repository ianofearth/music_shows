require('bundler/setup')
Bundler.require(:default, :production)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
	erb(:index)
end

get("/venues") do
	@venues = Venue.all()
	erb(:venues)
end

post("/venues/new") do
	venue_name = params.fetch("name")
	@venue = Venue.new({:name => venue_name})
	if @venue.save()
		redirect("/venues")
	else
		erb(:errors)
	end
end