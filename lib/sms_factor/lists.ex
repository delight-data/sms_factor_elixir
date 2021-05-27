defmodule SMSFactor.Lists do
  @moduledoc """
  Wrappers around **Lists** section of SMSFactor API.
  """

  @typedoc """
  ### Example

  ```elixir
  {
    "list": {
      "name": "My list",
      "contacts": {
        "gsm": [
          {
            "value": "33612345678",
            "info1": "Louis",
            "info2": "de Broglie",
            "info3": "1892",
            "info4": "Dieppe"
          },
          {
            "value": "33612345677",
            "info1": "Richard",
            "info2": "Feynman",
            "info3": "1918",
            "info4": "New-York"
          }
        ]
      }
    }
  }
  ```
  """
  @type list_params() :: %{list: %{atom() => String.t()}}

  @spec create_list(Tesla.Client.t(), list_params()) :: Tesla.Env.result()
  def create_list(client, params), do: Tesla.post(client, "/list", params)

  @spec clear_list(Tesla.Client.t(), String.t()) :: Tesla.Env.result()
  def clear_list(client, list_id), do: Tesla.put(client, "/list/#{list_id}/npai/clear")

  @spec get_lists(Tesla.Client.t()) :: Tesla.Env.result()
  def get_lists(client), do: Tesla.get(client, "/lists")

  @spec get_list(Tesla.Client.t(), String.t()) :: Tesla.Env.result()
  def get_list(client, list_id), do: Tesla.get(client, "/list/#{list_id}")

  @spec delete_list(Tesla.Client.t(), String.t()) :: Tesla.Env.result()
  def delete_list(client, list_id), do: Tesla.delete(client, "/list/#{list_id}")

  @spec blacklist(Tesla.Client.t()) :: Tesla.Env.result()
  def blacklist(client), do: Tesla.get(client, "/blacklist")

  @spec npai(Tesla.Client.t()) :: Tesla.Env.result()
  def npai(client), do: Tesla.get(client, "/npai")
end
