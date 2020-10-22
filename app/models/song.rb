class Song < ActiveRecord::Base
  belongs_to :user
  has_many :adds, dependent: :destroy
  has_many :users, through: :adds, source: :user
  validates :title, :artist, presence: true, length: { minimum: 2 }
end
