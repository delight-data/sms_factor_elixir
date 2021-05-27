defmodule SMSFactor.Notifications do
  @moduledoc """
  Wrappers around **Notifications** section of SMSFactor API.
  """

  @typedoc """
  Supports the following options :

  - `alert_trigger` The trigger that when reached sends notifications.
  - `alert_email` Activate or deactivate option for email(1 for true and 0 for false)
  - `alert_gsm` Activate or deactivate option for gsm(1 for true and 0 for false)
  - `email` Email you want receive notification with
  - `phone_number` Number you want receive notification with

  ## Example

  ```elixir
  {
    "notification":{
    "alert_trigger" : "500",
      "alert_email": "1",
      "alert_gsm": "1",
      "email" : "ano@nyme.com",
      "phone_number" : "33612345678"
    }
  }
  ```
  """
  @type balance_params() :: %{notifications: %{atom() => String.t()}}

  @spec get_balance(Tesla.Client.t()) :: Tesla.Env.result()
  def get_balance(client), do: Tesla.get(client, "/notification/balance")

  @spec update_balance(Tesla.Client.t(), balance_params()) :: Tesla.Env.result()
  def update_balance(client, params), do: Tesla.put(client, "/notification/balance", params)
end
