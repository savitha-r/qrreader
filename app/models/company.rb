class Company < ActiveRecord::Base
	
	belongs_to :user
	has_many :employees
	has_many :departments

	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

	validates_presence_of :name, :verified, :banned, :published
	validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, :presence => true

end
