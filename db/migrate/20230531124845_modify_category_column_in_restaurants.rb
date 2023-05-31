class ModifyCategoryColumnInRestaurants < ActiveRecord::Migration[7.0]
  def change
    change_column :restaurants, :category, :string, null: true, default: nil
  end
end
