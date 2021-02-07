class User < ActiveRecord::Base
    has_secure_password
    validates :name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
    
    has_many :meetings

end