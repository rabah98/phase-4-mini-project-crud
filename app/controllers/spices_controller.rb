class SpicesController < ApplicationController

    def index 
        spices = Spice.all 
        render json: spices, status: :ok 
    end

    def create 
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update 
        spice = Spice.find_by(id: params[:id])
        if spice 
            spice.update(spice_params)
            render json: spice, status: :updated
        else
            render json: {error: "spice_not_found"}, status: :not_found
        end
    end

    def destroy 
        spice = Spice.find_by(id: params[:id])
        if spice 
            spice.destroy
            head :no-content
        else
            render json: {error: "spice_not_found"}, status: :not_found
        end
    end

    private 

    def spice_params 
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
