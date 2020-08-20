class ChangeDateDatatype < ActiveRecord::Migration[6.0]
  def change
    change_column :concerts, :date, :date
  end
end
