class Employee < ActiveRecord::Base
	
	belongs_to :company
	has_many :department_employees
	has_many :departments, :through => :department_employees

	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

	validates_presence_of :first_name, :last_name
	validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, :presence => true
end
