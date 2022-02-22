import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :terrible, Terrible.Repo,
  migration_timestamps: [type: :utc_datetime_usec],
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "terrible_readstore_test",
  pool_size: 10

config :terrible, Terrible.EventStore,
  username: "postgres",
  password: "postgres",
  database: "terrible_eventstore_test",
  hostname: "localhost"

config :terrible, commanded_default_consistency: :strong

config :commanded, Commanded.EventStore.Adapters.InMemory,
  serializer: Commanded.Serialization.JsonSerializer

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :terrible, TerribleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "qizpvN86wIywBqkvrh9o6pgrFpo1rKlIbUfY546tMw1WKxNFjC81dhQDM1ZTxSTU",
  server: false

# In test we don't send emails.
config :terrible, Terrible.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
