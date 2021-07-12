defmodule SMSFactor.SendingStatus do
  @moduledoc """
  Helper to convert sending status code to message.
  """

  @status_by_code %{
    0 => :not_sent,
    1 => :sent,
    2 => :not_delivered,
    3 => :delivered,
    4 => :not_allowed,
    5 => :invalid_destination,
    6 => :invalid_sender,
    7 => :route_not_available,
    9 => :rejected,
    11 => :network_error,
    12 => :expired
  }

  @doc """
  Convert the given code to atom.
  """
  @spec to_status(integer()) :: atom()
  def to_status(code)

  for {code, status} <- @status_by_code do
    def to_status(unquote(code)), do: unquote(status)
  end

  def to_status(_), do: :unknown
end
