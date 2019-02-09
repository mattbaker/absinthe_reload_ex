defmodule AbsintheReload.ReloadPlug do
  @template_file "lib/absinthe_reload/user_schema.example"
  @ex_file "lib/absinthe_reload/user_schema.ex"

  def init(options), do: options

  def call(conn, _opts) do
    :global.trans({__MODULE__, self()}, fn ->
      if !File.exists?(@ex_file) do
        File.copy!(@template_file, @ex_file)
        IO.inspect("Compiling for the first time", label: __MODULE__)
        Code.compile_file(@ex_file)
      else
        IO.inspect("Reloading", label: __MODULE__)
        IEx.Helpers.r(AbsintheReload.UserSchema)
      end

      IEx.Helpers.r(AbsintheReload.AccountSchema)
      IEx.Helpers.r(AbsintheReload.Schema)
    end)

    conn
  end
end
