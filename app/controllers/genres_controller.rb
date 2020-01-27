class GenresController < ApplicationController

    before_action :set_genre, only: [:show, :update, :destroy]

    # GET /api/v1/genres
    def index
        @genres = Genre.where(artist_id: params[:artist_id])
        json_response(@genres)
    end

    # GET /api/v1/genre/:id
    def show
        json_response(@genre)
    end

    def genre_params
        # whitelist params
        params.permit(:name)
    end
    
    def set_genre
        @genre = Genre.find(params[:id])
    end

end
