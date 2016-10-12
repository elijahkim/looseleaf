defmodule Looseleaf.SessionController do
  use Looseleaf.Web, :controller
  alias Looseleaf.{PasswordManager, Repo}

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"user" => user}) do
    case PasswordManager.check(user, Repo) do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user)
        |> put_flash(:info, "Signed in successfully")
        |> redirect(to: "/profile")
      {:error, :wrong_combination} ->
        conn
        |> put_flash(:error, "Wrong username or password")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    Guardian.Plug.sign_out(conn)
    |> put_flash(:info, "Logged out successfully.")
    |> redirect(to: "/")
  end
end
