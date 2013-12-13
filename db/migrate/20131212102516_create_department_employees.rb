class CreateDepartmentEmployees < ActiveRecord::Migration
  def change
    create_table :department_employees do |t|
      t.integer :department_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
