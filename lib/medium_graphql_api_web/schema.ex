defmodule MediumGraphqlApiWeb.Schema do
    use Absinthe.Schema
    alias MediumGraphqlApiWeb.Resolvers

    # import types
    import_types(MediumGraphqlApiWeb.Schema.Types)
    

    query do
        @desc "Get a list of all users"
        field :users, list_of(:user_type) do
            resolve(&Resolvers.UserResolver.users/3)
        end

        @desc "get google drive data"
        field :google, list_of(:file_type) do
            resolve(&Resolvers.UserResolver.demo/3)
        end

        @desc "get google drive data"
        field :drive, list_of(:drive_type) do
            resolve(&Resolvers.SessionResolver.demo1/3)
        end

        @desc "get dropbox files"
        field :dropbox, list_of(:drive_type) do
            resolve(&Resolvers.UserResolver.dropbox_data/3)
        end
    end


    mutation do
        @desc "Register a new user"
        field :register_user, type: :user_type do
            arg(:input, non_null(:user_input_type))
            resolve(&Resolvers.UserResolver.register_user/3)
        end

        @desc "Login a user and return JWT token"
        field :login_user, type: :session_type do
            arg(:input, non_null(:session_input_type))
            resolve(&Resolvers.SessionResolver.login_user/3)
        end

        @desc "combine two api's"
        field :get_info, list_of(:user_type), type: :session_type do
            user = %{}
            Map.put(user, :u, resolve(&Resolvers.SessionResolver.login_user/3))
            arg(:input, non_null(:session_input_type))
            Map.put(user, :p, resolve(&Resolvers.UserResolver.register_user/3))
            {user}
        end
    end

    # subscription do

    # end

end
