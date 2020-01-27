defmodule MediumGraphqlApiWeb.Resolvers.UserResolver do
    alias MediumGraphqlApi.Accounts

    def users(_,_,_) do
        {:ok, Accounts.list_users()}
    end

    def register_user(_, %{input: input}, _) do
        Accounts.create_user(input)
    end

    def demo(_, _, _) do
        file = "./config/client_secret.json" |> File.read!
        fdata = Poison.decode!(file)
        Goth.Config.set(:project_id, fdata["project_id"])
        Goth.Config.set(:private_key_id, fdata["private_key_id"])
        
        Goth.Config.set(:private_key, fdata["private_key"])
        Goth.Config.set(:client_email, fdata["client_email"])
        Goth.Config.set(:client_id, fdata["client_id"])
        Goth.Config.set(:client_x509_cert_url, fdata["client_x509_cert_url"])

        {:ok, token} = Goth.Token.refresh!("https://www.googleapis.com/auth/drive")
        connection = GoogleApi.Drive.V3.Connection.new(token.token)
        {:ok, file_list} = GoogleApi.Drive.V3.Api.Files.drive_files_list(connection)
        data = Enum.map(file_list.files, fn (map) -> Map.take(map, [:name]) end)
        {:ok, data}
        # map = %{}
        # map = Map.put(map, :files, Enum.map(file_list.files, fn (x) -> x.name end))
        # {:ok, Map.get(map, :files)}
        
    end


    def dropbox_data(_, _, _) do
        file = "./config/dropbox.json" |> File.read!
        fdata = Poison.decode!(file)
        client = ElixirDropbox.Client.new(fdata["Access token"])
        data = ElixirDropbox.Files.ListFolder.list_folder(client, "")
        result = Enum.map(data["entries"], fn (map) -> for {key, val} <- Map.take(map, ["name"]), into: %{}, do: {String.to_atom(key), val} end)
        {:ok, result}
        # map = %{}
        # map = Map.put(map, :files, Enum.map(file_list.files, fn (x) -> x.name end))
        # {:ok, Map.get(map, :files)}
        
    end

    

end
