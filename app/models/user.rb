class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable
  has_many :events, dependent: :destroy, foreign_key: :creator
  has_many :attendances, dependent: :destroy
  has_many :attended_events, class_name: 'Event', foreign_key: 'event_id', through: :attendances

  before_validation :password_set

  private

  def password_set
    self.password = 'password'
    self.password_confirmation = 'password'
  end
end
