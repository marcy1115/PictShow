class User < ApplicationRecord
  # Validation
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  domain = /@.+/
  half_width_alphanumeric = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i

  with_options presence: true do
    validates :nickname, length: { maximum: 20 }
    validates :sexuality
    validates :birth
  end

  with_options presence: true, format: { with: half_width_alphanumeric } do
    validates :password, length: { minimum: 8 }
    validates :password_confirmation
  end

  # Association
  has_many :arts
end
