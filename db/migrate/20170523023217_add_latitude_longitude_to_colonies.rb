class AddLatitudeLongitudeToColonies < ActiveRecord::Migration[5.1]
  def change
    add_column :colonies, :latitude, :float
    add_column :colonies, :longitude, :float
  end
end
