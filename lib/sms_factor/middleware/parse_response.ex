defmodule SMSFactor.Middleware.ParseResponse do
  @moduledoc false

  @behaviour Tesla.Middleware

  @impl Tesla.Middleware
  def call(env, next, _opts) do
    # ? Maybe we should also handle Tesla errors
    with {:ok, response_env} <- Tesla.run(env, next) do
      handle_successfull_request(response_env)
    end
  end

  defp handle_successfull_request(%{body: %{"status" => status} = body}) do
    if status == 1 do
      {:ok, body}
    else
      {:error, error_for(status, body["message"])}
    end
  end

  @status_reasons %{
    -1 => "Authentication error",
    -2 => "XML error",
    -3 => "Not enough credits",
    -4 => "Incorrect date delay",
    -5 => "Contact list error",
    -6 => "JSON error",
    -7 => "Data error",
    -8 => "Your campaign is currently under moderation",
    -99 => "Unknown error"
  }

  defp error_for(status, message) do
    reason = Map.get(@status_reasons, status, "Unhandled error code #{status}")

    "#{reason} : #{message}"
  end
end
