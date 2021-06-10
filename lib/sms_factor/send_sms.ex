defmodule SMSFactor.SendSMS do
  @moduledoc """
  Wrappers around **Send SMS** section of SMSFactor API.
  """

  @typedoc """
  Params for sending SMS campaign.

  - `text` **(required)** : Your message
  - `value` **(required)** : The recipients' numbers
  - `pushtype` : The push type (alert or marketing)
  - `delay` : Sending date Y-m-d H:i:s
  - `sender` : Allows you to customize the sender
  - `gsmsmsid` : An id of your choice to link it to its delivery report

  ## Example

  ```elixir
  {
    "sms": {
      "message": {
        "text": "Message via API",
        "pushtype": "alert",
        "sender": "Illidan",
        "delay": "2021-06-06 10:28:32"
      },
      "recipients": {
        "gsm": [
          {
            "gsmsmsid": "100",
            "value": "33612345678"
          },
          {
            "gsmsmsid": "101",
            "value": "33612345677"
          }
        ]
      }
    }
  }
  ```
  """
  @type send_campaign_params() :: %{sms: %{atom() => any()}}

  @typedoc """
  Params for sending SMS.

  - `token` **(required if not in headers)** : Your token
  - `text` **(required)** : Your message
  - `to` **(required)** : Your destination
  - `pushtype` : The push type (alert or marketing)
  - `delay` : Sending date Y-m-d H:i:s
  - `sender` : Allows you to customize the sender
  - `gsmsmsid` : An id of your choice to link it to its delivery report

  ## Example

  ```elixir
  {
    "text": "Message via API",
    "to": ""33612345678"
    "pushtype": "alert",
    "sender": "Illidan",
    "delay": "2021-06-06 10:28:32",
    "gsmsmsid": "100"
  }
  ```
  """
  @type send_sms_params() :: %{atom() => any()}

  @spec single_message(Tesla.Client.t(), send_sms_params()) :: Tesla.Env.result()
  def single_message(client, params), do: Tesla.get(client, "/send", query: params)

  @spec campaign(Tesla.Client.t(), send_campaign_params()) :: Tesla.Env.result()
  def campaign(client, params), do: Tesla.post(client, "/send", params)

  @spec campaign_with_list(Tesla.Client.t(), send_campaign_params()) :: Tesla.Env.result()
  def campaign_with_list(client, params), do: Tesla.post(client, "/send/lists", params)

  @spec simulate_single_message(Tesla.Client.t(), send_sms_params()) :: Tesla.Env.result()
  def simulate_single_message(client, params) do
    Tesla.get(client, "/send/simulate", query: params)
  end

  @spec simulate_campaign(Tesla.Client.t(), send_campaign_params()) :: Tesla.Env.result()
  def simulate_campaign(client, params), do: Tesla.post(client, "/send/lists/simulate", params)

  @spec cancel_campaign(Tesla.Client.t(), String.t()) :: Tesla.Env.result()
  def cancel_campaign(client, campaign_id), do: Tesla.delete(client, "/send/#{campaign_id}")
end
