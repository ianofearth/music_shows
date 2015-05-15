ENV["RACK_ENV"] = "test"

require("bundler/setup")
Bundler.require(:default, :test)
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.after(:each) do
    Venue.all().each() do |venue|
      venue.destroy()
    end
    Band.all().each() do |band|
      band.destroy()
    end
  end
end