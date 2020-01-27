class Image < ApplicationRecord
  # model association
  belongs_to :album
  belongs_to :artist

  # validations
  validates_presence_of :height, :url, :width
end
