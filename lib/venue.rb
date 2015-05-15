class Venue <ActiveRecord::Base
	has_and_belongs_to_many :bands

	validates(:name, {:presence => true, :length => { :minimum => 1}})
	before_save(:title_case_venue)

private

	define_method(:title_case_venue) do
		special_words = ["and", "at", "it", "with", "to", "the", "of", "from", "but", "on", "or", "by", "all", "a", "has", "in"]
		capitalized_venue = []
		self.name = (venue = self.name.capitalize!.split(" ")
		venue.each do |word|
			if special_words.include?(word)
				capitalized_venue.push(word)
			else
				word.capitalize!()
				capitalized_venue.push(word)
			end
		end
		capitalized_venue.join(" "))
	end

end