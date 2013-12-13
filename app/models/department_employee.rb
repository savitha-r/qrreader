class DepartmentEmployee < ActiveRecord::Base
	
	belongs_to :department
	belongs_to :employee
	validates_presence_of :department_id, :employee_id
end
