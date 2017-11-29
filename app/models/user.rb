class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :omniauthable, :omniauth_providers => [:facebook]
  # :rememberable, :trackable, :validatable
  has_many :notes

  has_many :subscriber_users, class_name: "Relation", foreign_key: :poster_id, dependent: :destroy
  has_many :subscribers, through: :subscriber_users

  has_many :poster_users, class_name: "Relation", foreign_key: :subscriber_id
  has_many :posters, through: :poster_users

end
