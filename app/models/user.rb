class User < ApplicationRecord
	has_secure_password

	has_many :articles, dependent: :destroy

	validates :name, presence: true
	validates :password, presence: true, length: { minimum: 6}


end
