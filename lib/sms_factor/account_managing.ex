defmodule SMSFactor.AccountManaging do
  @moduledoc """
  Wrappers around **Account Managing** section of SMSFactor API.
  """

  @typedoc """
  Params to create account or sub-account.

  - `email` **(required)** : The email of the account
  - `password` **(required)** : The password must be at least 6 characters long (25 max)
  - `country_code` **(required if main account)** : The country code associated to the account (ISO 3166-1 alpha-2)
  - `firstname` : The firstname associated to the account
  - `lastname` : The lastname associated to the account
  - `city` : The city associated to the account
  - `phone` : The phone number associated to the account
  - `address1` : The address associated to the account
  - `address2` : Further information about the address
  - `zip` : The zip code
  - `company` : The company associated to the account
  - `type` : Select one between : company, association, administration, private
  - `sender` : The default sender that will be used for your sendings
  - `description` : Feel free to write anything about this account
  - `isChild` : integer 0 for a main account, 1 for a sub-account
  - `unlimited` **(required if isChild)** : Is the account unlimited ? If unlimited, the sub-account uses the parent's credits. If not, the main account has to give a certain amount of credits to its sub-account.

  ## Example

  ```elixir
  {
    "account":{
      "email" : "vasili@sovietnavy.com",
      "password" : "av01d_nuc13Ar_War",
      "firstname" : "Vasili",
      "lastname": "Arkhipov",
      "city" : "Zvorkovo",
      "phone": "33612345678",
      "address1": "Somewhere in Zvorkovo",
      "zip": "386",
      "country_code" : "ru",
      "isChild" : 1,
      "unlimited" : 0
    }
  }
  ```
  """
  @type account_params() :: %{account: %{atom() => any()}}

  @typedoc """
  Params for updating retention.

  Supports the following options :

  - `message` : The data retention time of your messages
  - `list` : The data retention time of your lists (-1 for endless expiration)
  - `survey` : The data retention time of your surveys
  - `campaign` : The data retention time of your campaigns

  After your number put a 'd' for day and a 'm' for month.

  ## Example

  ```elixir
  {
    "retention":{
      "message": "2d",
      "survey": "5m",
      "list": "2m",
      "campaign": "5m"
    }
  }
  ```
  """
  @type retention_params() :: %{retention: %{atom() => any()}}

  @spec credits(Tesla.Client.t()) :: Tesla.Env.result()
  def credits(client), do: Tesla.get(client, "/credits")

  @spec retrieve_account(Tesla.Client.t()) :: Tesla.Env.result()
  def retrieve_account(client), do: Tesla.get(client, "/account")

  @spec retrieve_sub_accounts(Tesla.Client.t()) :: Tesla.Env.result()
  def retrieve_sub_accounts(client), do: Tesla.get(client, "/sub-accounts")

  @spec create_account(Tesla.Client.t(), account_params()) :: Tesla.Env.result()
  def create_account(client, params), do: Tesla.post(client, "/account", params)

  @spec get_retention(Tesla.Client.t()) :: Tesla.Env.result()
  def get_retention(client), do: Tesla.get(client, "/retention")

  @spec update_retention(Tesla.Client.t(), retention_params()) :: Tesla.Env.result()
  def update_retention(client, params), do: Tesla.put(client, "/retention", params)
end
