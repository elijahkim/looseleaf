defmodule Looseleaf.UserController do
  use Looseleaf.Web, :controller
  alias Looseleaf.{User, Repo, Registration}

  def new(conn, _params) do
    changeset = User.changeset(%User{})

    render conn, "new.html", changeset: changeset,
      layout: {Looseleaf.LayoutView, "home.html"}
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Registration.create(changeset, Repo) do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user)
        |> put_flash(:info, "Your account was created")
        |> redirect(to: "/entries/new")
      {:error, changeset} ->
        conn
        |> put_flash(:info, "Unable to create account")
        |> render("new.html", changeset: changeset)
    end
  end
end
