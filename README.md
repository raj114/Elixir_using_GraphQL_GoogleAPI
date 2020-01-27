# MediumGraphqlApi

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).


# Installation For Dropbox
 If available in Hex, the package can be installed as:

 Add elixir_dropbox to your list of dependencies in mix.exs:

 def deps do [{:elixir_dropbox, "~> 0.0.7"}] end

 Ensure elixir_dropbox is started before your application:

 def application do [applications: [:elixir_dropbox]] end



# Installation for GoogleApi.Drive
 Manages files in Drive including uploading, downloading, searching, detecting changes, and updating sharing permissions.

 Install this package from Hex by adding google_api_drive to your list of dependencies in mix.exs:

 def deps do
   [{:google_api_drive, "~> 0.10"}]
 end

# Usage for DropBox
$ iex -S mix
 iex(1)> client = ElixirDropbox.Client.new("TOKEN")
 
 iex(2)> ElixirDropbox.Users.current_account(client)
 
 iex(3)> ElixirDropbox.Users.current_account_to_struct(client)
 
 iex(4)> ElixirDropbox.Files.create_folder(client, "/test")
 
 iex(5)> ElixirDropbox.Files.create_folder_to_struct(client, "/test")


# Usage of GoogleDrive 
 iex(1)> {:ok, token} = Goth.Token.refresh!("https://www.googleapis.com/auth/drive")
 
 iex(2)> connection = GoogleApi.Drive.V3.Connection.new(token.token)
 
 iex(3)> {:ok, file_list} = GoogleApi.Drive.V3.Api.Files.drive_files_list(connection)


## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
