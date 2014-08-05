class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :kpts
  has_one :preference

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.new({
        :name => auth.extra.raw_info.name,
        :provider => auth.provider,
        :uid => auth.uid,
        :email => auth.info.email,
        :password => Devise.friendly_token[0, 40],
      })
      user.save(:validate => false)
    end
    user
  end
end
