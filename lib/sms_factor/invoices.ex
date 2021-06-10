defmodule SMSFactor.Invoices do
  @moduledoc """
  Wrappers around **Invoices** section of SMSFactor API.
  """

  @spec get_invoices(Tesla.Client.t()) :: Tesla.Env.result()
  def get_invoices(client), do: Tesla.get(client, "/account/invoice")

  @spec get_invoice(Tesla.Client.t(), String.t()) :: Tesla.Env.result()
  def get_invoice(client, invoice_id), do: Tesla.get(client, "/account/invoice/#{invoice_id}")

  @spec download_invoice(Tesla.Client.t(), String.t()) :: Tesla.Env.result()
  def download_invoice(client, invoice_id) do
    Tesla.get(client, "/account/invoice/#{invoice_id}/download")
  end
end
