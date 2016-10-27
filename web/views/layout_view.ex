defmodule Looseleaf.LayoutView do
  use Looseleaf.Web, :view

  def active_link_class(conn, view) do
    phoenix_view = conn.private.phoenix_view

    if phoenix_view == view do
      "layout__nav-button--active"
    else
      "layout__nav-button"
    end
  end

  def nav_active_link_class(conn, view) do
    phoenix_view = conn.private.phoenix_view

    if phoenix_view == view do
      "layout__off-canvas-link--active"
    else
      "layout__off-canvas-link"
    end
  end
end
