class AddArtistIdToConcerts < ActiveRecord::Migration[6.0]
  def change
    add_column :concerts, :artist_id, :integer
  end
end
