# SMSFactor

Wrapper around SMSFactor API.

This package uses [tesla](https://github.com/teamon/tesla) as HTTP client.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `sms_factor_elixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:sms_factor_elixir, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/sms_factor_elixir](https://hexdocs.pm/sms_factor_elixir).

## Configuration

You can configure your main API key with the following configuration :

```elixir
config :sms_factor, main_api_key: <your_token>
```

## Usage

The first you need is to create a **Tesla.Client** with the wanted token, it can be your main token or a sub-account token.

Once you have a client for the account you want to use, you can pass it to any wrapper function.

```elixir
# Create client
client = SMSFactor.client("my_token")

# Send single SMS
sms_params = %{text: "Hello, World!", to: "3312345678"}
SMSFactor.SendSMS.single_message(client, sms_params)
```
