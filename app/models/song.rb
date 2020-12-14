class Song < ApplicationRecord
  belongs_to :album
  has_one :band, through: :album
  validates :name, :album, presence: true
  validates :name, :uniqueness => { :scope => :album }
end
