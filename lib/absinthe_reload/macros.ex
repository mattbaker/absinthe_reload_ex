defmodule AbsintheReload.Macros do
  defmacro dynamic_import_type do
    if user_type_imported? do
      quote do: import_types(AbsintheReload.UserSchema)
    else
      quote do
      end
    end
  end

  defmacro dynamic_import_fields do
    if user_type_imported? do
      quote do: import_fields(:stitched_fields)
    else
      quote do
      end
    end
  end

  def user_type_imported? do
    File.exists?("lib/absinthe_reload/user_schema.ex")
  end
end
