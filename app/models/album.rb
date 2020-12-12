class Album < ApplicationRecord
  belongs_to :band
  validates :name, :band, presence: true
  #validates :name, :uniqueness => { :scope => :band }
end
