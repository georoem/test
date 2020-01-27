class SongsController < ApplicationController
    before_action :set_song, only: [:show, :update, :destroy]

    # GET /api/v1/songs
    def index
        @songs = Song.where(album_id: params[:album_id])
        json_response(@songs)
    end

    # GET /api/v1/songs/:id
    def show
        json_response(@song)
    end

    def song_params
        # whitelist params
        params.permit(:name, :spotify_url, :spotify_id)
    end
    
    def set_song
        @song = Song.find(params[:id])
    end
end
