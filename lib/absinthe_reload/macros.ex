defmodule AbsintheReload.Macros do
  defmacro dynamic_import_type do
    if File.exists?("lib/absinthe_reload/whiz_bang.ex") do
      quote do: import_types(AbsintheReload.WhizBang)
    else
      quote do
      end
    end
  end

  defmacro dynamic_import_fields do
    if File.exists?("lib/absinthe_reload/whiz_bang.ex") do
      quote do: import_fields(:stitched_fields)
    else
      quote do
      end
    end
  end
end
