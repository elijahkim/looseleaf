defmodule Looseleaf.PasswordResetController do
  use Looseleaf.Web, :controller
  alias Looseleaf.{PasswordResetter, Repo, User}

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

  def show(conn, %{"id" => token}) do
    user = Repo.get_by(User, password_reset_token: token)

    conn
    |> Guardian.Plug.sign_in(user)
    |> redirect(to: password_path(conn, :edit, user))
  end
end
