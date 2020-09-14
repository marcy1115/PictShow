class Art < ApplicationRecord
  #Validation
  with_options presence: true do
    validates :image
    validates :age_limit
  end

  #Association
  belongs_to :user
  has_one_attached :image
  has_many :comments
end
