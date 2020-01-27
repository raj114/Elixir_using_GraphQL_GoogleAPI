defmodule  MediumGraphqlApiWeb.Resolvers.SessionResolver do
    alias MediumGraphqlApi.Accounts
    alias MediumGraphqlApi.Accounts.Guardian

    def login_user(_, %{input: input}, _) do
        with {:ok, user} <- Accounts.Session.authenticate(input),
             {:ok, jwt_token, _} <- Guardian.encode_and_sign(user) do
            {:ok,%{token: jwt_token, user: user}}
        end
    end

    def demo1(_, _, _) do
        file = "./config/client_secret_1.json" |> File.read!
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


end

