defmodule SMSFactor do
  @moduledoc """
  Wrapper for SMSFactor API.
  """

  def client(nil) do
    token = Application.fetch_env!(:sms_factor, :main_api_key)
    client(token)
  end

  def client(token) do
    middlewares = [
      # This middleware should always run before Tesla.Middleware.JSON
      # otherwise the response would not be decoded before parsing.
      SMSFactor.Middleware.ParseResponse,
      {Tesla.Middleware.Headers,
       [
         {"Authorization", "Bearer " <> token},
         {"Accept", "application/json"}
       ]},
      {Tesla.Middleware.BaseUrl, "https://api.smsfactor.com"},
      Tesla.Middleware.JSON
    ]

    Tesla.client(middlewares)
  end
end
