defmodule Looseleaf.PageController do
  use Looseleaf.Web, :controller
  use Guardian.Phoenix.Controller
  alias Looseleaf.{EntryView, Entry}

  plug :put_layout, "home.html"

  def index(conn, _params, current_user, _claims) do
    case current_user do
      nil -> render(conn, "index.html")
      _ -> redirect(conn, to: entry_path(conn, :new))
    end
  end
end
