class User < ActiveRecord::Base
	attr_accessible :name, :password_digest, :role, :email
	has_one :company

	has_secure_password

	validates_presence_of :name, :password_digest, :role, :email

	ROLES = ["member", "super admin"]
end
