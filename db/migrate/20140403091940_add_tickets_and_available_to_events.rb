class AddTicketsAndAvailableToEvents < ActiveRecord::Migration
  def change
    add_column :events, :tickets, :integer
    add_column :events, :available, :integer
  end
end
