class CreateProductFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :product_features do |t|
      t.references :feature, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
