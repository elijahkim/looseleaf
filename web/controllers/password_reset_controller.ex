defmodule Looseleaf.PasswordResetController do
  use Looseleaf.Web, :controller
  alias Looseleaf.{PasswordResetter, Repo}

  def create(conn, %{"email" => email}) do
    PasswordResetter.reset_password(email, Repo)

    conn
    |> redirect(to: page_path(conn, :index))
  end
end
