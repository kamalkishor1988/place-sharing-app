class AddSharedIdToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :shared_ids, :string, array: true, default: []
    add_column :places, :public, :boolean, default: false
  end
end
