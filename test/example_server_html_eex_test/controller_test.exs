defmodule ExampleServerHtmlEexTest.ControllerTest do
  use ExUnit.Case
  use Plug.Test

  describe "GET /greet" do
    test "responds with an HTML document" do
      conn = conn(:get, "/greet")
      |> ExampleServerHtmlEex.Router.call([])

      assert conn.status == 200
      assert get_heading(conn) == "Hello World"
    end

    test "responds with an HTML document using greeting" do
      conn = conn(:get, "/greet?greeting=Hola")
      |> ExampleServerHtmlEex.Router.call([])

      assert conn.status == 200
      assert get_heading(conn) == "Hola World"
    end

    defp get_heading(conn) do
      {:ok, html} = Floki.parse_document(conn.resp_body)
      html
      |> Floki.find("h1")
      |> Floki.text()
    end
  end

end
