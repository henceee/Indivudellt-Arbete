class User < ActiveRecord::Base
  
  has_many :adventures
  has_many :reservations
  has_many :reviews
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable #:confirmable
  
  include Gravtastic
  gravtastic
  
  gravtastic :default	 => :mm
  
  validates :fullname, presence: true, length: {maximum: 50}
  

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    
    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.fullname = auth.info.name
        user.provider = auth.provider
        user.uid = auth.info.uid
        user.email = auth.info.email
        user.image = auth.info.image
        user.password = Devise.friendly_token[0,20]
      end
    end
    
  end
  

  
end

