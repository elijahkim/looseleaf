defmodule Looseleaf.AnalysisController do
  use Looseleaf.Web, :controller
  use Guardian.Phoenix.Controller
  alias Looseleaf.{Entry, Repo}

  def index(conn, _params, current_user, _claims) do
    entries =
      Entry.query_by_user(current_user)
      |> Repo.all
      |> Poison.encode!

    render(conn, "index.html", current_user: current_user, entries: entries)
  end
end
