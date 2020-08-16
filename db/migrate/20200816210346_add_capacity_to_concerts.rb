class AddCapacityToConcerts < ActiveRecord::Migration[6.0]
  def change
    add_column :concerts, :capacity, :integer
  end
end
