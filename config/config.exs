# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

secret_key_base = "LpyXu+9MG2EOJyazOWNKZf22Zq43gj6PCMDk7nWJAeG9yXkM8UOkEeiCFbmynAYH"

# General application configuration
config :looseleaf,
  ecto_repos: [Looseleaf.Repo]

# Configures the endpoint
config :looseleaf, Looseleaf.Endpoint,
  url: [host: "localhost"],
  secret_key_base: secret_key_base,
  render_errors: [view: Looseleaf.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Looseleaf.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  issuer: "Looseleaf",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: secret_key_base,
  serializer: Looseleaf.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
