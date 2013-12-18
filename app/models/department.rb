class Department < ActiveRecord::Base
	
	belongs_to :company
	has_many :department_employees
	has_many :employees, :through => :department_employees

	validates :name, presence: true



end
