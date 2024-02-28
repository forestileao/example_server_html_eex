defmodule ExampleServerHtmlEex.Controller do
  use Plug.Builder
  import Plug.Conn
  import Pedro.Controller
  require EEx

  def call(conn, action: action) do
    conn = super(conn, [])
    apply(__MODULE__, action, [conn, conn.params])
  end

  def greet(conn, params) do
    greeting = params |> Map.get("greeting", "Hello")
    conn
    |> put_status(200)
    |> render_html("greet.xhtml.eex", greeting: greeting)
  end

  defp render_html(conn, file, assigns)  do
    ExampleServerHtmlEex.View.render(conn, file, assigns)
  end

  defp html_file_path(file) do
    Path.join([
      :code.priv_dir(:example_server_html_eex),
      "templates",
      file
    ])
  end
end
