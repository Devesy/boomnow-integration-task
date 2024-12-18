# frozen_string_literal: true

class Api::Boomnow::Client
  TOKEN_CACHE_KEY = "boomnow_token"
  API_BASE_URL = "https://app.boomnow.com/open_api/v1/"

  attr_reader :token

  def initialize
    auth
  end

  private

  # TODO: move id/secret to credentials
  def auth
    @token = Rails.cache.read(TOKEN_CACHE_KEY)
    return if @token

    client_params = { client_id: ENV["BOOMNOW_API_CLIENT_ID"], client_secret: ENV["BOOMNOW_API_CLIENT_SECRET"] }.to_json
    response = RestClient.post(API_BASE_URL + "auth/token", client_params)
    body = JSON.parse(response.body)
    @token = body["access_token"]
    Rails.cache.write(TOKEN_CACHE_KEY, @token, expires_in: body["expires_in"])
  rescue e
    Rails.logger.error(e)
  end
end
