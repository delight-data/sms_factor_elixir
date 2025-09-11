defmodule SMSFactor.MixProject do
  use Mix.Project

  def project do
    [
      app: :sms_factor,
      version: "0.4.0",
      elixir: "~> 1.18",
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
      {:tesla, "~> 1.0"},
      {:jason, "~> 1.0"},
      {:credo, "~> 1.0", only: [:dev, :test], runtime: false},
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
