defmodule SMSFactor.HLRLookup do
  @moduledoc """
  Wrappers around **HLR Lookup** section of SMSFactor API.
  """

  @type lookup_params() :: %{lookup: %{to: list(String.t())}}

  @spec lookup(Tesla.Client.t(), lookup_params()) :: Tesla.Env.result()
  def lookup(client, params), do: Tesla.post(client, "/lookup", params)
end
