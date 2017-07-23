class AddColumnsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :address, :string
    add_column :products, :tags, :string, array: true, default: []
    add_column :products, :name, :string
    add_column :products, :description, :text
  end
end
