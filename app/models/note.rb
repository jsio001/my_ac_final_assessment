class Note < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  validates :title, presence: true
  validates :body, presence: true

end
