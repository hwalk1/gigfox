class ChangeVenuePricePerHourToInteger < ActiveRecord::Migration[6.1]
  def change
    change_column :venues, :price_per_hour, :integer
  end
end
