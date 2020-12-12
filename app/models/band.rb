class Band < ApplicationRecord
  has_many :albums, dependent: :destroy
  validates :name, presence:true
  validates :name, uniqueness: true
end
