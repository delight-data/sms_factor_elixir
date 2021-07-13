defmodule SMSFactor.MixProject do
  use Mix.Project

  def project do
    [
      app: :sms_factor,
      version: "0.2.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),

      # Docs
      name: "SMSFactor",
      source_url: "https://github.com/delight-data/sms_factor_elixir",
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
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
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end

  defp description do
    "Wrapper around SMSFactor API"
  end

  defp package do
    [
      files: ~w(lib .formatter.exs mix.exs README.md LICENSE),
      licenses: ["AML"],
      links: %{"GitHub" => "https://github.com/delight-data/sms_factor_elixir"}
    ]
  end
end
