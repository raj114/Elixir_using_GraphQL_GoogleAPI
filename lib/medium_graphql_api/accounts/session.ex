defmodule MediumGraphqlApi.Accounts.Session do
    alias  MediumGraphqlApi.Accounts.User
    alias  MediumGraphqlApi.Repo 
    alias MediumGraphqlApi.Accounts

    def authenticate(args) do
        user = Repo.get_by(User, email: String.downcase(args.email))

        if args.password == user.password_hash do
            {:ok, user}
        end
    end
end