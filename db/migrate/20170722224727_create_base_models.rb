class CreateBaseModels < ActiveRecord::Migration[5.1]
  def change
    create_table :base_models do |t|
      t.string "data_key"
      t.string "data_value"
      t.timestamps
    end
  end
end
