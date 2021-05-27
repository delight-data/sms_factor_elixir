defmodule SMSFactor.APIToken do
  @moduledoc """
  Wrappers around **API Token** section of SMSFactor API.
  """

  @type token_params() :: %{token: %{name: String.t()}}

  @spec create_token(Tesla.Client.t(), token_params()) :: Tesla.Env.result()
  def create_token(client, params), do: Tesla.post(client, "/token", params)

  @spec create_sub_account_token(Tesla.Client.t(), integer(), token_params()) ::
          Tesla.Env.result()
  def create_sub_account_token(client, sub_account_id, params) do
    Tesla.post(client, "/token/account/#{sub_account_id}", params)
  end

  @spec retrieve_tokens(Tesla.Client.t()) :: Tesla.Env.result()
  def retrieve_tokens(client), do: Tesla.get(client, "/token")

  @spec delete_token(Tesla.Client.t(), integer()) :: Tesla.Env.result()
  def delete_token(client, token_id), do: Tesla.delete(client, "/token/#{token_id}")
end
