class CreateUsers < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password

      t.timestamps null: false
    end



    create_table :events do |t|
      t.string :name
      t.datetime :date

      t.integer :user_id

      t.timestamps null: false
    end




    create_table :items do |t|
      t.string :name
      t.string :url
      
      t.integer :status_id
      t.integer :event_id

      t.timestamps null: false
    end



    create_table :item_statuses do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end



    add_index :events, :user_id
    add_index :items, :event_id
    add_index :items, :status_id


  end
end
