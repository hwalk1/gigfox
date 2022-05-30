class CreateVenues < ActiveRecord::Migration[6.1]
  def change
    create_table :venues do |t|
      t.string :name
      t.text :description
      t.string :location
      t.decimal :price_per_hour
      t.string :room_size
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
