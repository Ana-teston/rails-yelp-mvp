class AddCategoryConstraintToRestaurants < ActiveRecord::Migration[7.0]

  def change
    change_column :restaurants, :category, :string, null: false, default: 'chinese'
  end
end
