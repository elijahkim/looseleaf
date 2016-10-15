use Mix.Config

config :looseleaf, Looseleaf.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [
    scheme: "https",
    host: "looseleaf-production.herokuapp.com",
    port: 443
  ],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :looseleaf, Looseleaf.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true

# Do not print debug messages in production
config :logger, level: :info
