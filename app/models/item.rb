class Item < ActiveRecord::Base
	#attr_accessible :name, :url, :status_id, :purchased

	belongs_to :event
	belongs_to :item_statuses, class_name: "ItemStatus"

end
