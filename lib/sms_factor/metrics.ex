defmodule SMSFactor.Metrics do
  @moduledoc """
  Wrappers around **Metrics** section of SMSFactor API.
  """

  @typedoc """
  Params for getting consumption.

  - `date_start` : Add a filter to retrieve consumption of which send date is after this date. Date format must be as follow: Y-m-d
  - `date_end` : Add a filter to retrieve consumption of which send date is before this date. Date format must be as follow: Y-m-d
  - `country` : Add a filter to retrieve your consumption for specific country. You can retrieve the consumption for multiple countries separated by a comma. Countries must be provided in alpha2 format. country=FR,CH
  - `sub_account_id` : Add a filter to retrieve the consumption of a specific sub account.

  ## Example

  ```elixir
  %{
    date_start: "2021-01-01",
    date_end: "2021-01-31",
    country: "FR,CH",
    sub_account_id: "1234567890"
  }
  ```
  """
  @type consumption_params() :: %{atom() => String.t()}

  @spec get_consumption(Tesla.Client.t(), consumption_params()) :: Tesla.Env.result()
  def get_consumption(client, params),
    do: Tesla.get(client, "/metrics/consumption", query: params)
end
