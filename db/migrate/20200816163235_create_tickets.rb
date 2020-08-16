class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :concert_id
      t.integer :category
      t.integer :price
      t.integer :quantity

      t.timestamps
    end
  end
end
