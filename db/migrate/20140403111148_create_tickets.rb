class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :user
      t.string :event_id
      t.boolean :paid
      t.boolean :used

      t.timestamps
    end
  end
end
