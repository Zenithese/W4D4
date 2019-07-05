class Band < ApplicationRecord
    validates :name, presence: true

    def index
        @band = Band.all
        render :index
    end

    def create
        @band = Band.find_by(band_params)

        if @band.save

        else
            flash.now[:errors] = @band.errors.full_messages
        end
    end

    def new
        @band = Band.new
        render :new
    end

    def show
        render :show
    end

end
