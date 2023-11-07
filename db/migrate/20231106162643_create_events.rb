class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :started_date
      t.integer :duration
      t.integer :price
      t.string :location
      t.bigint :user_id

      t.timestamps
    end
    add_foreign_key :events, :users, column: :user_id
  end
end
