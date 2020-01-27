class Song < ApplicationRecord
  # model association
  belongs_to :album

  # validations
  validates_presence_of :name, :spotify_url, :preview_url, :duration_ms, :explicit, :spotify_id
end
