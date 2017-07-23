class CreateFeatures < ActiveRecord::Migration[5.1]
  def change
    create_table :features do |t|
      t.string :name
      t.string :category
      t.integer :extra_cost

      t.timestamps
    end
  end
end
