defmodule ExampleServerHtmlEex.MixProject do
  use Mix.Project

  def project do
    [
      app: :example_server_html_eex,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:pedro, git: "https://github.com/forestileao/pedro.git", tag: "1.1.0"},
      {:plug_cowboy, "~> 2.0"}
    ]
  end
end
