class Artist < ApplicationRecord
    # model association
    has_many :albums, dependent: :destroy
    has_many :images, dependent: :destroy

    # validations
    validates_presence_of :name, :popularity, :spotify_url, :spotify_id

end
