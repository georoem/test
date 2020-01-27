class ArtistsController < ApplicationController
    before_action :set_artist, only: [:show, :update, :destroy]

    # GET /api/v1/artists
    def index
        @artists = Artist.all
        json_response(@artists)
    end

    # GET /api/v1/artists/:id
    def show
        json_response(@artist)
    end

    def artist_params
        # whitelist params
        params.permit(:name, :spotify_url, :spotify_id)
    end
    
    def set_artist
    @artist = Artist.find(params[:id])
    end
end
