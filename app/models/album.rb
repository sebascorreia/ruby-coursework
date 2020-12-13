class Album < ApplicationRecord
  belongs_to :band
  has_many :songs,dependent: :destroy
  validates :name, :band, presence: true
  validates :name, :uniqueness => { :scope => :band }
end
