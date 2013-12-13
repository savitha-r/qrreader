class Company < ActiveRecord::Base
	attr_accessible :name, :description, :verfied, :banned, :published, :email, :address, :fax, :phone, :phone2, :postal_code
	belongs_to :user
	has_many :employees
	has_many :departments

	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

	validates_presence_of :name, :verfied, :banned, :published
	validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }, :presence => true

end
