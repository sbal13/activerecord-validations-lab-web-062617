class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
	validate :clickbaity

	def clickbaity
		phrases = ["Won't Believe", "Secret", "Top", "Guess"]
		if title.present? && phrases.none?{|phrase| title.include?(phrase)}
			errors.add(:title, "not click-baity enough" )
		end
	end
end
