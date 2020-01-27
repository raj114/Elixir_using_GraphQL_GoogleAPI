defmodule MediumGraphqlApiWeb.Schema.Types.FileType do
    use Absinthe.Schema.Notation

    object :file_type do
        field(:name, :string)
    end
end