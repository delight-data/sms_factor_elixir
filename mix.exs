defmodule SMSFactor.MixProject do
  use Mix.Project

  def project do
    [
      app: :sms_factor,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:tesla, "~> 1.4.0"},
      {:hackney, "~> 1.17.0"},
      {:jason, ">= 1.0.0"},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false}
    ]
  end
end
