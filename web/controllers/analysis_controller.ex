defmodule Looseleaf.AnalysisController do
  use Looseleaf.Web, :controller
  use Guardian.Phoenix.Controller
  alias Looseleaf.{Entry, Repo, EntryHelper}

  def index(conn, _params, current_user, _claims) do
    entries =
      Entry.query_by_user(current_user)
      |> Repo.all

    render_analysis(conn, current_user, entries)
  end

  defp render_analysis(conn, current_user, entries) when length(entries) >= 3 do
    entries =
      entries
      |> EntryHelper.assemble_chart_data
      |> Poison.encode!

    render(conn, "index.html", current_user: current_user, entries: entries)
  end

  defp render_analysis(conn, current_user, _) do
    render(conn, "not_yet.html", current_user: current_user)
  end
end
