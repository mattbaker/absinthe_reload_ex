defmodule AbsintheReload.MixProject do
  use Mix.Project

  def project do
    [
      app: :absinthe_reload,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {AbsintheReload.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:absinthe, "~> 1.4"},
      {:absinthe_plug, "~> 1.4.0"},
      {:poison, "~> 3.1.0"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
