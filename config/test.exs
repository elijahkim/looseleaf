use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :looseleaf, Looseleaf.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :looseleaf, Looseleaf.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "looseleaf_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :looseleaf, watson_client: Looseleaf.Watson.InMemory

config :wallaby,
  phantomjs: "./node_modules/phantomjs/bin/phantomjs",
  screenshot_dir: "./screenshots",
  screenshot_on_failure: true

config :comeonin, :bcrypt_log_rounds, 4
config :comeonin, :pbkdf2_rounds, 1

config :looseleaf, Looseleaf.Mailer,
  adapter: Bamboo.TestAdapter
