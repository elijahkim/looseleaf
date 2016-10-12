defmodule Looseleaf.PageControllerTest do
  use Looseleaf.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Loose Leaf"
  end
end
