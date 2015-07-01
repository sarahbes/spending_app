class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
