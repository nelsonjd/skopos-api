class AddWeightToWeightings < ActiveRecord::Migration[7.0]
  def change
    add_column :weightings, :weight, :integer
  end
end
