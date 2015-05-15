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
	@venues = Venue.all()
	erb(:band)
end

# get("/bands/:id") do
# 	@band = Band.find(params.fetch("id").to_i())
# 	@venues = Venue.all()
# 	redirect("/bands/:id")
# end


get("/venues/:id") do ### added this, hope it works
	id = params.fetch("id").to_i()
	@venue = Venue.find(id)
	@bands = Band.all()
	erb(:venue)
end

post("/bands/new") do
	band_name = params.fetch("name")
	@band = Band.new({:name => band_name})
	if @band.save()
		redirect("/bands/")
	else
		erb(:errors)
	end
end

delete("/bands/delete") do
	band_id = params.fetch("band_delete_select").to_i()
	band = Band.find(band_id)
	band.delete()
	redirect("/bands")
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

patch("/bands/:id/add_venue") do
	@venues = Venue.all()#added, hope it works
	id = params.fetch("id").to_i()
	@band = Band.find(id)
	venue_id = params.fetch("venue_select_band").to_i()
	venue = Venue.find(venue_id)
	@band.venues().push(venue)
	redirect("/bands/" + id.to_s())
end

