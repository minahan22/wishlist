class ItemStatus < ActiveRecord::Base
	#attr_accessible :name, :description

	has_many :items, foreign_key: :status_id

end




