class Employee < ActiveRecord::Base
	
	belongs_to :company
	has_many :department_employees
	has_many :departments, :through => :department_employees
#	accepts_nested_attributes_for :department_employees, :allow_destroy => true
#	accepts_nested_attributes_for :departments, :allow_destroy => true

	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

	validates_presence_of :first_name, :last_name
	validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, :presence => true

	after_create :assign_hashed_id

	PRIME = 2654435761
  	MAXID = 2**12-1

	def name
		self.first_name + ' ' + self.last_name
	end

	def assign_hashed_id
		self.hashed_id = (self.id * MAXID & PRIME)
		self.save
	end
end
