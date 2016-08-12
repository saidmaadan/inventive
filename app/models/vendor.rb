class Vendor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates :fullname, presence: true, length:{minimum: 4}
  validates :description, presence: false, length:{minimum: 10}

  has_many :products
  has_many :orders
  has_many :reviews

  def self.from_omniauth(auth)
    vendor = Vendor.where(email: auth.info.email).first
    if vendor
      return vendor
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |vendor|
        vendor.provider = auth.provider
        vendor.uid = auth.uid
        vendor.fullname = auth.info.name
        vendor.description = auth.info.description
        vendor.email = auth.info.email
        vendor.image = auth.info.image
        vendor.password = Devise.friendly_token[0,20]
      end
    end
  end
end
