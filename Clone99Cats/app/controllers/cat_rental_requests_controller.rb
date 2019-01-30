class CatRentalRequestsController < ApplicationController
  def new
    @cat_rental_request = CatRentalRequest.new(cat_id: params[:cat_id])
    render :new
  end

  def create
    render json: params
  end
end
