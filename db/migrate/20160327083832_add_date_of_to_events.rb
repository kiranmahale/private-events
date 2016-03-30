class AddDateOfToEvents < ActiveRecord::Migration
  def change
    add_column :events, :date_of, :datetime
  end
end
