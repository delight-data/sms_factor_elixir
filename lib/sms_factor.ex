defmodule SMSFactor do
  @moduledoc """
  Wrapper for SMSFactor API.
  """

  def client(nil) do
    token = Application.fetch_env!(:sms_factor, :main_api_key)
    client(token)
  end

  def client(token) do
    middleware = [
      {Tesla.Middleware.Headers,
       [
         {"Authorization", "Bearer " <> token},
         {"Accept", "application/json"}
       ]},
      {Tesla.Middleware.BaseUrl, "https://api.smsfactor.com"},
      Tesla.Middleware.JSON
    ]

    Tesla.client(middleware)
  end
end
