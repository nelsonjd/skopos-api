class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    create_table :portfolios do |t|

      t.timestamps
    end

    create_table :weightings do |t|
      t.string :ticker
      t.references :portfolio
      t.timestamps
    end
  end
end
