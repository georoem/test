class AlbumsController < ApplicationController
    before_action :set_album, only: [:show, :update, :destroy]

    # GET /api/v1/albums
    def index
        @albums = Album.where(artist_id: params[:artist_id])
        json_response(@albums)
    end

    # GET /api/v1/albums/:id
    def show
        json_response(@album)
    end

    def album_params
        # whitelist params
        params.permit(:name, :spotify_url, :spotify_id)
    end
    
    def set_album
        @album = Album.find(params[:id])
    end

end
