defmodule SMSFactor.Webhooks do
  @moduledoc """
  Wrappers around **Webhooks** section of SMSFactor API.
  """

  @typedoc """
  Webhook Type can be any of the following :

  - "MO"
  - "DLR"
  - "STOP"
  - "CLICKER"
  - "BALANCE_ALERT"
  """
  @type webhook_type() :: String.t()

  @type webhook_params() :: %{webhook: %{type: webhook_type(), url: String.t()}}

  @spec create_webhook(Tesla.Client.t(), webhook_params()) :: Tesla.Env.result()
  def create_webhook(client, params), do: Tesla.post(client, "/webhook", params)

  @spec retrieve_webhooks(Tesla.Client.t()) :: Tesla.Env.result()
  def retrieve_webhooks(client), do: Tesla.get(client, "/webhook")

  @spec update_webhook(Tesla.Client.t(), integer(), webhook_params()) :: Tesla.Env.result()
  def update_webhook(client, webhook_id, params) do
    Tesla.put(client, "/webhook/#{webhook_id}", params)
  end

  @spec delete_webhook(Tesla.Client.t(), String.t()) :: Tesla.Env.result()
  def delete_webhook(client, webhook_id), do: Tesla.delete(client, "/webhook/#{webhook_id}")
end
