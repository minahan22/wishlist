namespace :static_data do
  desc "Add ItemStatus to database"
  task :add_item_statuses => :environment do

  	add_item_statuses

  end
end





def add_item_statuses
	ItemStatus.create(name: "Open", description: "Item not purchased yet")
	ItemStatus.create(name: "Closed", description: "Item purchased")
end