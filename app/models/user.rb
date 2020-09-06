class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  domain = /@.+/
  half_width_alphanumeric = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

  with_options presence: true do
    validates :nickname, length: { maximum: 20 }
    validates :email, format: { with: domain }
    validates :sexuality
    validates :birth
  end

  with_options presence: true, format: { with: half_width_alphanumeric } do
    validates :password
    validates :password_confirmation
  end
end
