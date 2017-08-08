class User < ApplicationRecord
  has_secure_password


  has_many :authentication, dependent: :destroy
  has_many :pins

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, presence: true, length: { minimum: 3 }, allow_nil: true
  validates :email, uniqueness: true 


   def self.create_with_auth_and_hash(authentication, auth_hash)
      create! do |user|
        user.name = auth_hash["extra"]["raw_info"]["name"],
        user.email = auth_hash["extra"]["raw_info"]["email"],
        user.password = SecureRandom.hex(3),
        user.authentication << (authentication)
      end
    end
  
        # name: auth_hash["name"],
    #     email: auth_hash["extra"]["raw_info"]["email"],
    #     password: SecureRandom.hex(3),
    #   )
    #   user.authentications << authentication
    #   return user
    # end

    # grab fb_token to access Facebook for user data
    def fb_token
      x = self.authentications.find_by(provider: 'facebook')
      return x.token unless x.nil?
    end

  

end
