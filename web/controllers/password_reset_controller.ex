defmodule Looseleaf.PasswordResetController do
  use Looseleaf.Web, :controller
  alias Looseleaf.{PasswordResetter, Repo}

  plug :put_layout, "home.html"

  def new(conn, _params) do
    conn
    |> render("new.html")
  end

  def create(conn, %{"password_reset" => %{"email" => email}}) do
    PasswordResetter.reset_password(email, Repo)

    conn
    |> redirect(to: page_path(conn, :index))
  end
end
