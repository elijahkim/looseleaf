defmodule Looseleaf.PasswordControllerTest do
  use Looseleaf.ConnCase
  import Looseleaf.Factory

  test "GET /password/:user_id/edit", %{conn: conn} do
    user = insert(:user)
    conn = get conn, "/password/#{user.id}/edit"

    assert html_response(conn, 200)
  end
end
