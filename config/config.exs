# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :medium_graphql_api,
  ecto_repos: [MediumGraphqlApi.Repo]

config :elixir_dropbox, base_url: "https://api.dropboxapi.com/2"
config :elixir_dropbox, upload_url: "https://content.dropboxapi.com/2/"
# Configures the endpoint
config :medium_graphql_api, MediumGraphqlApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XHHjRnRmartU/i/jrgTet9NQRvbyKNgkLOaj18HU3v28xixw+GHq0OuEFvytTO1M",
  render_errors: [view: MediumGraphqlApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MediumGraphqlApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :medium_graphql_api, MediumGraphqlApi.Accounts.Guardian,
       issuer: "medium_graphql_api",
       secret_key: "rLwGVwLXyqVpm/p5MUnKs0zaqntvmusnW6IQGDcAFtI1iGK6amb6sDk5M24dmEDT"

config :goth,
       json: "./config/client_secret.json" |> File.read!


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
