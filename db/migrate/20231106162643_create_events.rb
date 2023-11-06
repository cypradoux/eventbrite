class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :started_date
      t.integer :duration
      t.integer :price
      t.string :location

      t.timestamps
    end
  end
end
