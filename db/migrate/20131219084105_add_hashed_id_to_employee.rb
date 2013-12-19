class AddHashedIdToEmployee < ActiveRecord::Migration
  def change
  	add_column :employees, :hashed_id, :integer
  end
end
