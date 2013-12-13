class AddIndexes < ActiveRecord::Migration
  def change
  	add_index(:companies, :user_id)
  	add_index(:employees, :company_id)
  	add_index(:departments, :company_id)
  	add_index(:department_employees, :department_id)
  	add_index(:department_employees, :employee_id)
  end
end
