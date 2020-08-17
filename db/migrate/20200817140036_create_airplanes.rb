class CreateAirplanes < ActiveRecord::Migration[6.0]
  def change
    create_table :airplanes do |t|
      t.string :address
      t.string :model
      t.string :category
      t.integer :seat_capacity
      t.integer :range
      t.integer :daily_price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
