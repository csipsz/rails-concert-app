class RemovePerformerColumnFromConcerts < ActiveRecord::Migration[6.0]
  def change
    remove_column :concerts, :performer, :string
  end
end
