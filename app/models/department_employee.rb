class DepartmentEmployee < ActiveRecord::Base
	attr_accessible :department_id, :employee_id

	validates_presence_of :department_id, :employee_id
end
