class Album < ApplicationRecord #defining album class
  belongs_to :band  #child class of band
  has_many :songs,dependent: :destroy #parent class of song
  validates :name, :band, presence: true  #cant be null
  validates :name, :uniqueness => { :scope => :band } #album name must be unique inside the band object
end
