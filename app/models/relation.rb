class Relation < ApplicationRecord
  belongs_to :subscriber, class_name: "User"
  belongs_to :poster, class_name: "User"

  validate :disallow_subscribe_to_self

  def disallow_subscribe_to_self
    if subscriber_id == poster_id
      errors.add(:poster_id, 'cannot follow yourself')
    end
  end

end
