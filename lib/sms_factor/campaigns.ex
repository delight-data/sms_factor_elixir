defmodule SMSFactor.Campaigns do
  @moduledoc """
  Wrappers around **Campaigns** section of SMSFactor API.
  """

  @typedoc """
  Params for retrieving campaigns history.

  - `start` : You can define the start record for pagination. Default 0
  - `length` : You can define the number of records to retrieve per request. Default 100. Maximum 1000
  - `date_start` : Add a filter to retrieve campaigns of which send date is after this date. Date format must be as follow: `Y-m-d H:i:s`
  - `date_end` : Add a filter to retrieve campaigns of which send date is before this date. Date format must be as follow: `Y-m-d H:i:s`
  - `sms_min` : Add a filter to retrieve campaigns that have a minimum amount of SMS
  - `sms_max` : Add a filter to retrieve campaigns that have a maximum amount of SMS
  """
  @type campaigns_history_params() :: %{atom() => any()}

  @spec get_campaigns_history(Tesla.Client.t(), campaigns_history_params()) :: Tesla.Env.result()
  def get_campaigns_history(client, params \\ %{}) do
    Tesla.get(client, "/campaigns", query: params)
  end

  @spec get_campaign(Tesla.Client.t(), integer()) :: Tesla.Env.result()
  def get_campaign(client, campaign_id), do: Tesla.get(client, "/campaign/#{campaign_id}")

  @spec blacklist_campaign_npai(Tesla.Client.t(), integer()) :: Tesla.Env.result()
  def blacklist_campaign_npai(client, campaign_id) do
    Tesla.put(client, "/campaign/#{campaign_id}/npai")
  end

  @spec get_campaign_stops(Tesla.Client.t(), integer()) :: Tesla.Env.result()
  def get_campaign_stops(client, campaign_id) do
    Tesla.get(client, "/campaign/#{campaign_id}/blacklist")
  end

  @spec get_campaign_npais(Tesla.Client.t(), integer()) :: Tesla.Env.result()
  def get_campaign_npais(client, campaign_id) do
    Tesla.get(client, "/campaign/#{campaign_id}/npai")
  end

  @spec get_campaign_replies(Tesla.Client.t(), integer()) :: Tesla.Env.result()
  def get_campaign_replies(client, campaign_id) do
    Tesla.get(client, "/campaign/#{campaign_id}/mo")
  end
end
