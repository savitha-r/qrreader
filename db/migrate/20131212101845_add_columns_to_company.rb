class AddColumnsToCompany < ActiveRecord::Migration
  def change
  	add_column :companies, :phone2, :string
  	add_column :companies, :postal_code, :string
  	add_column :companies, :user_id, :integer
  end
end
