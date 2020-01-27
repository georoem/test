class Genre < ApplicationRecord
  # model association
  belongs_to :artist

  # validations
  validates_presence_of :name
end
