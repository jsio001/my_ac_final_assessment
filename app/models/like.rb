class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likednotes, class_name: "Note"

end
