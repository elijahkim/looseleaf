defmodule Looseleaf.EntryController do
  use Looseleaf.Web, :controller
  use Guardian.Phoenix.Controller
  alias Looseleaf.{Entry, Repo}

  def new(conn, _params, current_user, _claims) do
    changeset = Entry.changeset(%Entry{})

    render(conn, "new.html", current_user: current_user, changeset: changeset)
  end

  def create(conn, %{"entry" => entry_params}, current_user, _claims) do
    entry_params = entry_params |> Map.put("user_id", current_user.id)
    changeset = Entry.changeset(%Entry{}, entry_params)

    case Repo.insert(changeset) do
      {:ok, entry} ->
        conn
        |> redirect(to: "/entries/new")
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Failed to journal")
        |> render("new.html", changeset: changeset)
    end
  end
end
