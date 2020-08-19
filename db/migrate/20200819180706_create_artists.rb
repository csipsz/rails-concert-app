class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :artist_name
      t.string :password_digest
      t.string :phone_number

      t.timestamps
    end
  end
end
