class User < ActiveRecord::Base
    has_secure_password
    validates :name, presence: { message: "must be given please" }
    validates :last_name, presence: { message: "must be given please" }
    validates :email, presence: { message: "must be given please" }
    validates :email, uniqueness: { message: "email address already taken" }
    
    has_many :meetings

end