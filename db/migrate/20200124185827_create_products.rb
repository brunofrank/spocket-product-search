class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title, null: false, limit: 60
      t.text :description, null: false
      t.string :country, null: false, limit: 60
      t.jsonb :tags, default: []
      t.decimal :price, precision: 16, scale: 2

      t.timestamps
    end
  end
end
