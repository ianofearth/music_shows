class Band <ActiveRecord::Base
	has_and_belongs_to_many :venues

	validates(:name, {:presence => true, :length => { :minimum => 1 }})
	before_save(:title_case_band)

	private

	define_method(:title_case_band) do
		special_words = ["and", "at", "it", "with", "to", "the", "of", "from", "but", "on", "or", "by", "all", "a", "has", "in"]
		capitalized_band = []
		self.name = (band = self.name.capitalize!.split(" ")
		band.each do |word|
			if special_words.include?(word)
				capitalized_band.push(word)
			else
				word.capitalize!()
				capitalized_band.push(word)
			end
		end
		capitalized_band.join(" "))
	end
end