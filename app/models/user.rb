class User < ActiveRecord::Base
	has_one :company

	has_secure_password

	validates_presence_of :name, :password_digest, :email

	validates_uniqueness_of :email
	before_create :create_remember_token, :assign_role

	ROLES = ["member", "super admin"]

	private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def assign_role
    	self.role = "member"
    end
end
