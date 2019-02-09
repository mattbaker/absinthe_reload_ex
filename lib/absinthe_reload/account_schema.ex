defmodule AbsintheReload.AccountSchema do
  use Absinthe.Schema.Notation
  import AbsintheReload.Macros, only: :macros

  dynamic_import_type()

  object :account_fields do
    field(:account, :account)
  end

  object :account do
    dynamic_import_fields()

    field(:name, :string)
  end
end
