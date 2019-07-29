class ChangeTimeToString < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :time, :string
  end
end
