defmodule AbsintheReload.Router do
  use Plug.Router

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
    pass: ["*/*"],
    json_decoder: Poison
  )

  plug(:match)
  plug(:dispatch)
  plug(AbsintheReload.ReloadPlug)

  forward("/graphql",
    to: Absinthe.Plug,
    init_opts: [schema: AbsintheReload.Schema]
  )

  forward("/graphiql",
    to: Absinthe.Plug.GraphiQL,
    init_opts: [
      schema: AbsintheReload.Schema,
      interface: :simple
    ]
  )

  match(_, do: send_resp(conn, 404, "Oops!"))
end
