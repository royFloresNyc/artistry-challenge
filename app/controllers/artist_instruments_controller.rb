class ArtistInstrumentsController < ApplicationController
    def new
        @artist_instrument = ArtistInstrument.new
    end 

    def create
        @artist_instrument = ArtistInstrument.find_or_create_by(params.require(:artist_instrument).permit(:artist_id, :instrument_id))
        redirect_to artist_path(@artist_instrument.artist)
    end

end 