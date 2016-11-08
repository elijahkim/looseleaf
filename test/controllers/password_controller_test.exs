defmodule Looseleaf.PasswordControllerTest do
  use Looseleaf.ConnCase
  import Looseleaf.Factory

  test "GET /password/:user_id/edit", %{conn: conn} do
    user = insert(:user)
    conn =
      guardian_login(user)
      |> get(conn, "/password/#{user.id}/edit")

    assert html_response(conn, 200)
  end

  def guardian_login(user, token \\ :token, opts \\ []) do
    build_conn()
    |> bypass_through(Looseleaf.Router, [:browser, :browser_session, :browser_authenticated])
    |> get("/")
    |> Guardian.Plug.sign_in(user, token, opts)
    |> send_resp(200, "Flush the session yo")
    |> recycle()
  end
end
