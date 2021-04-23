class ArtistsController < ApplicationController

    def show
        current_artist
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params)
        @artist.save
        redirect_to artist_path(@artist)
    end

    def edit
        current_artist
    end

    def update
        current_artist.update(artist_params)
        redirect_to artist_path(@artist)
    end

    private

    def current_artist
        @artist = Artist.find_by(id: params[:id])
    end

    def artist_params
        params.require(:artist).permit(:name, :bio)
    end

end
