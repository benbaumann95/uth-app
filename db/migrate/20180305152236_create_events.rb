class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :quantity
      t.string :location
      t.date :date
      t.datetime :start_time
      t.datetime :end_time
      t.string :type

      t.timestamps
    end
  end
end
