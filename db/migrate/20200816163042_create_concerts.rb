class CreateConcerts < ActiveRecord::Migration[6.0]
  def change
    create_table :concerts do |t|
      t.string :performer
      t.string :location
      t.string :date

      t.timestamps
    end
  end
end
