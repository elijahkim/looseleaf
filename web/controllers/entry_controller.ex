defmodule Looseleaf.EntryController do
  use Looseleaf.Web, :controller
  use Guardian.Phoenix.Controller
  alias Looseleaf.{Entry, EntrySaver, Repo}

  def new(conn, _params, current_user, _claims) do
    changeset = Entry.changeset(%Entry{})

    render(conn, "new.html", current_user: current_user, changeset: changeset)
  end

  def create(conn, %{"entry" => entry_params}, current_user, _claims) do
    case EntrySaver.save_entry(entry_params, current_user, Repo) do
      {:ok, entry} ->
        conn
        |> redirect(to: "/entries/success")
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Failed to journal")
        |> render("new.html", changeset: changeset)
    end
  end

  def success(conn, _params, current_user, _claims) do
    conn
    |> render("success.html", current_user: current_user)
  end
end
