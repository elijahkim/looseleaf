defmodule Looseleaf.PasswordController do
  use Looseleaf.Web, :controller
  use Guardian.Phoenix.Controller

  plug :put_layout, "home.html"

  def edit(conn, _params, _current_user, _claims) do
    conn
    |> render("edit.html")
  end
end
