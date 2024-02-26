defmodule ExampleServerHtmlEexTest.ControllerTest do
  use ExUnit.Case
  use Plug.Test

  describe "GET /greet" do
    test "responds with an HTML document" do
      conn = conn(:get, "/greet")
      |> ExampleServerHtmlEex.Router.call([])

      assert conn.status == 200
      assert conn.resp_body =~ "<h1>Hello World</h1>"
    end

    test "responds with an HTML document using greeting" do
      conn = conn(:get, "/greet?greeting=Hi")
      |> ExampleServerHtmlEex.Router.call([])

      assert conn.status == 200
      assert conn.resp_body =~ "<h1>Hi World</h1>"
    end
  end

end
