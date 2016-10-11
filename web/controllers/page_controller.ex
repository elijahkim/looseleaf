defmodule Looseleaf.PageController do
  use Looseleaf.Web, :controller

  plug :put_layout, "home.html"

  def index(conn, _params) do
    render conn, "index.html"
  end
end
