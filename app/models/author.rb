class Author < ApplicationRecord
	has_and_belongs_to_many :papers
	def name
		return first_name + " " + last_name
	end
	validates :first_name, presence: true
	validates :last_name, presence: true
end
