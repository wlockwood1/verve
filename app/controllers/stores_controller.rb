class StoresController < ApplicationController
  def index
    if params[:search].present?
      @stores = Store.near(params[:search], 50, :order => "distance")
    else
      @stores = Store.distance_to_verve.limit(10)
    end
  end

  def show
    @store = Store.find(params[:id])
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to root_path, :notice => "Successfully created store."
    else
      render :action => 'new'
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      redirect_to @store, :notice  => "Successfully updated store."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    redirect_to stores_url, :notice => "Successfully destroyed store."
  end

  def import
    if Store.import(params[:file])
      redirect_to root_url, notice: "Stores imported."
    else
      redirect_to root_url, notice: "Please submit .tsv file"
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :address, :city, :state, :postal_code, :country, :latitude, :longitude)
  end

end
