use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rpg_item, RpgItem.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :rpg_item, RpgItem.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "spduggan",
  password: "postgres",
  database: "rpg_item_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
