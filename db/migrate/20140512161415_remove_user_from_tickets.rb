class RemoveUserFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :user, :string
  end
end
