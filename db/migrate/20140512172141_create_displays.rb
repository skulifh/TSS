class CreateDisplays < ActiveRecord::Migration
  def change
    create_table :displays do |t|
      t.integer :event_id

      t.timestamps
    end
  end
end
