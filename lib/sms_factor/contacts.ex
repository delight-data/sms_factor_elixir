defmodule SMSFactor.Contacts do
  @moduledoc """
  Wrappers around **Contacts** section of SMSFactor API.
  """

  @typedoc """
  Params for defining a contact.

  ## Example

  ```elixir
  {
    "value": "33612345676",
    "info1": "Hedy",
    "info2": "Lamarr",
    "info3": "Extase",
    "info4": "1933"
  }
  ```
  """
  @type contact_params() :: %{atom() => String.t()}

  @typedoc """
  Params for defining contacts list.

  ## Example

  ```elixir
  {
    "list": {
      "listId": 50433,
      "contacts": {
        "gsm": [
          {
            "value": "33612345678",
            "info1": "Hiroo",
            "info2": "Onoda"
          },
          {
            "value": "33612345677",
            "info1": "Grace",
            "info2": "Hopper"
          },
          {
            "value": "33612345676",
            "info1": "Hedy",
            "info2": "Lamarr",
            "info3": "Extase",
            "info4": "1933"
          }
        ]
      }
    }
  }
  ```
  """
  @type contact_list_params() :: %{list: %{atom() => String.t()}}

  @spec add_contact(Tesla.Client.t(), contact_list_params()) :: Tesla.Env.result()
  def add_contact(client, params), do: Tesla.post(client, "/list", params)

  @spec deduplicate_list(Tesla.Client.t(), integer()) :: Tesla.Env.result()
  def deduplicate_list(client, list_id), do: Tesla.put(client, "/list/deduplicate/#{list_id}")

  @spec remove_contact(Tesla.Client.t(), integer()) :: Tesla.Env.result()
  def remove_contact(client, contact_id), do: Tesla.delete(client, "/list/contact/#{contact_id}")

  @spec remove_contact_from_blacklist(Tesla.Client.t(), integer()) :: Tesla.Env.result()
  def remove_contact_from_blacklist(client, contact_id),
    do: Tesla.delete(client, "/blacklist/contact/#{contact_id}")

  @spec update_contact(Tesla.Client.t(), integer(), contact_params()) :: Tesla.Env.result()
  def update_contact(client, contact_id, params) do
    Tesla.put(client, "/list/contact/#{contact_id}", params)
  end

  @spec insert_to_blacklist(Tesla.Client.t(), contact_list_params()) :: Tesla.Env.result()
  def insert_to_blacklist(client, params), do: Tesla.post(client, "/blacklist", params)

  @spec insert_to_npai_list(Tesla.Client.t(), contact_list_params()) :: Tesla.Env.result()
  def insert_to_npai_list(client, params), do: Tesla.post(client, "/npai", params)
end
