defmodule MediumGraphqlApiWeb.Schema.Types.DriveType do
    use Absinthe.Schema.Notation

    object :drive_type do
        field(:name, :string)
    end
end