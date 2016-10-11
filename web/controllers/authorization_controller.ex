defmodule Looseleaf.AuthorizationController do
  use Looseleaf.Web, :controller

  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:error, "Please Sign in")
    |> redirect(to: "/")
  end
end
