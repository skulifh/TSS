class AddColumncToEvents < ActiveRecord::Migration
  def change
    add_column :events, :type, :integer
  end
end
