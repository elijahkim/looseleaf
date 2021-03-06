defmodule Looseleaf.UserController do
  use Looseleaf.Web, :controller
  alias Looseleaf.{User, Repo, Registration}

  def new(conn, _params) do
    changeset = User.changeset(%User{})

    render_new(conn, changeset)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Registration.create(changeset, Repo) do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user)
        |> put_flash(:info, "Your account was created")
        |> redirect(to: tutorial_path(conn, :show, 1))
      {:error, changeset} ->
        conn
        |> put_flash(:info, "Unable to create account")
        |> render_new(changeset)
    end
  end

  defp render_new(conn, changeset) do
    conn
    |> render("new.html", changeset: changeset,
      layout: {Looseleaf.LayoutView, "home.html"})
  end
end
