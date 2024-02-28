defmodule ExampleServerHtmlEex.View do
  def render(conn, file, assigns) do
    # Module is given to map view functions for the EEx template
    Pedro.View.render(__MODULE__, conn, file, assigns)
  end
end
