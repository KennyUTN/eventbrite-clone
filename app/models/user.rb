class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  has_many :events, dependent: :destroy, foreign_key: :creator
  has_many :attendances, dependent: :destroy
  has_many :attended_events, class_name: 'Event', foreign_key: 'event_id', through: :attendances
end
