defmodule MediumGraphqlApiWeb.Schema.Types do
    use Absinthe.Schema.Notation

    alias MediumGraphqlApiWeb.Schema.Types

    import_types(Types.UserType)
    import_types(Types.SessionType)
    import_types(Types.FileType)
    import_types(Types.DriveType)
end