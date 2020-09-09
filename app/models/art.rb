class Art < ApplicationRecord
  #Validation
  with_options presence: true do
    validates :image
  end

  #Association
  belongs_to :user
  has_one_attached :image
end
