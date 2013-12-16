class User < ActiveRecord::Base
	has_one :company

	has_secure_password

	validates_presence_of :name, :password_digest, :role, :email

	ROLES = ["member", "super admin"]
end
