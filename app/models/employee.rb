class Employee < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :email, :mobile, :office_phone, :fax, :title, :description, :urls

	belongs_to :company
	has_many :department_employees
	has_many :departments, :through => :department_employees

	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

	validates_presence_of :first_name, :last_name
	validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, :presence => true
end
