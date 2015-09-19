class StoresController < ApplicationController
  def index
    if params[:search].present?
      @base_address = params[:search]
    else
      @base_address = "5973 Avenida Encinas, Carlsbad, CA"
    end
    if params[:radius].present?
      @stores = Store.near(@base_address, params[:radius], :order => "distance").limit(20)
    else
      @stores = Store.near(@base_address, 5, :order => "distance").limit(20)
    end
    @hash = Gmaps4rails.build_markers(@stores) do |store, marker|
      marker.lat store.latitude
      marker.lng store.longitude
    end
  end

  def import
    if Store.import(params[:file])
      redirect_to root_url, notice: "Stores imported."
    else
      redirect_to root_url, notice: "Stores not imported. Please submit .tsv file"
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :address, :postal_code, :latitude, :longitude, :geocoded_address)
  end

end
