class AddPurchasedToItems < ActiveRecord::Migration
  def change

  	add_column :items, :purchased, :boolean
  	add_index :items, :purchased

  end
end
