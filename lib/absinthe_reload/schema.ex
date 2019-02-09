defmodule AbsintheReload.Schema do
  use Absinthe.Schema
  import_types(AbsintheReload.AccountSchema)

  query do
    import_fields(:account_fields)
    field(:test, :string)
  end
end
