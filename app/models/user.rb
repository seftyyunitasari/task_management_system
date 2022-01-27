class User < ApplicationRecord
	has_many :tasks, dependent: :destroy
	has_secure_password
	before_validation {email.downcase!}
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :password, length: {minimum: 6}
end
