class Api::V1::Listings::ListingsController < ApplicationController
  def search
    search_params = { city: params[:city], adults: params[:adults] }
    service = Api::Boomnow::Service.new
    listings = service.search_listings(search_params)
    render json: { listings: listings }
  # TODO: make error handlging more precise
  rescue error
    render json: { error: error }, status: :bad_request
  end
end
