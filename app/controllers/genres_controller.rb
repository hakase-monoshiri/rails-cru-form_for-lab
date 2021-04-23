class GenresController < ApplicationController
    
    def show
        current_genre
    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.new(genre_params)
        @genre.save
        redirect_to genre_path(@genre)
    end

    def edit
        current_genre
    end

    def update
        current_genre.update(genre_params)
        redirect_to genre_path(@genre)
    end

    private

    def current_genre
        @genre = Genre.find_by(id: params[:id])
    end

    def genre_params
        params.require(:genre).permit(:name)
    end
end
