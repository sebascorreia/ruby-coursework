class Band < ApplicationRecord #defining band class
  has_many :albums, dependent: :destroy #deletes dependent objects
  validates :name, presence:true
  validates :name, uniqueness: true #band name is unique
end
