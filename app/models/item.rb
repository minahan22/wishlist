class Item < ActiveRecord::Base
	# attr_accessible :name, :url, :purchased

	belongs_to :event
	belongs_to :status, class_name: "ItemStatus"

end
