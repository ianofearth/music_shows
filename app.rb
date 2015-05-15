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
get("/venues/:id") do
	id = params.fetch("id").to_i()
	@venue = Venue.find(id)
	erb(:venue)
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

get("/bands") do
	@bands = Band.all()
	erb(:bands)
end
get("/bands/:id") do
	id = params.fetch("id").to_i()
	@band = Band.find(id)
	erb(:band)
end

post("/bands/new") do
	band_name = params.fetch("name")
	@band = Band.new({:name => band_name})
	if @band.save()
		redirect("/bands")
	else
		erb(:errors)
	end
end

patch("/bands/update") do
	band_id = params.fetch("band_select").to_i()
	@band = Band.find(band_id)
	if params.fetch("name_update") != ""
		name = params.fetch("name_update")
		@band.update({:name => name})
	end
	redirect("/bands")
end

