class AddDescriptionColumnToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :description, :string, :null => true

    change_column :categories, :name, :string, :null => false
  end
end
