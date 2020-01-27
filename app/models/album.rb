class Album < ApplicationRecord
  # model association
  belongs_to :artist
  has_many :songs, dependent: :destroy
  has_many :images, dependent: :destroy

  # validations
  validates_presence_of :name, :total_tracks, :spotify_url, :spotify_id
end
