class Song < ApplicationRecord #defining song class
  belongs_to :album #child class of album
  has_one :band, through: :album #grandchild class of band
  validates :name, :album, presence: true
  validates :name, :uniqueness => { :scope => :album } #unique inside album object
end
