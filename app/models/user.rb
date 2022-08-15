class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true, uniqueness: true, length: {minimum: 5, maximum: 50}, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, message: 'Must be a valid email'}

    # validates :password_digest, presence: true, uniqueness: true, length: {minimum: 6, maximum: 50}
    
    
end
