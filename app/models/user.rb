class User < ApplicationRecord
    has_many :messages
    has_many :rooms, through: :messages
    has_one_attached :avatar
    has_secure_password
    validates :username, uniqueness: true, presence: true
end
