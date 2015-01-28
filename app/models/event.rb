class Event < ActiveRecord::Base
	# attr_accessible :name

	belongs_to :user
	has_many :items
    accepts_nested_attributes_for :items
end


