class User < ActiveRecord::Base
	has_one :company, :dependent => :destroy

	has_secure_password

	validates_presence_of :name, :password_digest, :email



	validates_uniqueness_of :email
	before_create :create_remember_token, :assign_role

	ROLES = ["member", "super admin"]

	def is_super_admin?
    	self.role == "super admin"
    end

    def get_members
    	User.where("role == 'member'")
    end

	private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def assign_role
    	self.role = "member"
    end



end
