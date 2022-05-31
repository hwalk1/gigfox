class AddPictureUrlToVenues < ActiveRecord::Migration[6.1]
  def change
    add_column :venues, :picture_url, :string
  end
end
