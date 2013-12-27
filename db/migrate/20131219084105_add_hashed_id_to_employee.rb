class AddHashedIdToEmployee < ActiveRecord::Migration
  def change
  	add_column :employees, :secure_id, :string
  	add_index(:employees, :secure_id)
  end
end
