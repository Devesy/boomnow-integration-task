# frozen_string_literal: true

class Api::Boomnow::Service
  API_LISTINGS_SEARCH_URL = "listings"
  API_LISTINGS_CITIES_URL = "listings/cities"

  def initialize
    @client = Api::Boomnow::Client.new
  end

  # could be cached and rendered in search field
  def cities
    response = call_api(API_LISTINGS_CITIES_URL)
    response["cities"]
  end

  def search_listings(params)
    search_params = { adults: params[:adults], city: params[:city] }
    response = call_api(API_LISTINGS_SEARCH_URL, search_params)
    response["listings"]
  rescue e
    Rails.logger.error e
  end

  private

  def call_api(url, params = nil)
    response = RestClient.get(Api::Boomnow::Client::API_BASE_URL + url,
      { Authorization: @client.token, params: params || {} })
    JSON.parse(response.body)
  end
end
