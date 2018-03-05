class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :photo
      t.boolean :display_flag
      t.integer :price
      t.text :description
      t.references :user, foreign_key: true
      t.boolean :sold
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
