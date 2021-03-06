class Note < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

end
