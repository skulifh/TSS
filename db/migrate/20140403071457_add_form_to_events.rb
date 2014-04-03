class AddFormToEvents < ActiveRecord::Migration
  def change
    add_column :events, :form, :integer
  end
end
