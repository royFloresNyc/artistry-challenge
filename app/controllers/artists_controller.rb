class ArtistsController < ApplicationController
    def index
        @artists = Artist.all
    end 

    def show
        @artist = Artist.find(params[:id])
    end 

    def new
        @artist = Artist.new
    end 

    def create
        @artist = Artist.create(params.require(:artist).permit(:name, :age, :title))
        if @artist.valid?
            redirect_to artist_path(@artist)
        else 
            flash[:errors] = @artist.errors.full_messages
            redirect_to new_artist_path
        end 
    end 

end
