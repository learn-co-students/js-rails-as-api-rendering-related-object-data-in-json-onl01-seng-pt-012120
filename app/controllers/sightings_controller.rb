class SightingsController < ApplicationController
  def show
    sighting = Sighting.find_by(id: params[:id])
    # render json: sighting
    # render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
    if sighting
      # render json: sighting, include: [:bird, :location]
      render json: sighting, include: [:bird, :location], except: [:updated_at]
    else
      render json: { message: 'No sighting found with that id' }
    end
  end

  def index
    sightings = Sighting.all
    render json: sightings, include: [:bird, :location]
  end
end
