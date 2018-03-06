class ChangeDateTypeInEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :date_and_time, :datetime
    remove_column :events, :date
    remove_column :events, :start_time
    remove_column :events, :end_time
  end
end
