class Account < ApplicationRecord
    has_secure_password

    validates :account_id, presence: true
    validates :username, presence: true
    validates :password_digest, presence: true

    validates :account_id, uniqueness: true
    validates :username, uniqueness: true

    
end
