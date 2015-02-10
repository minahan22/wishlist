class AddPurchasedByToItem < ActiveRecord::Migration
  def change
    add_column :items, :Purchased_By, :string
  end
end
