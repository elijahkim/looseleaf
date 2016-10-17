defmodule Looseleaf.TutorialView do
  use Looseleaf.Web, :view

  def chicklet_class(page, page) do
    "tutorial__chicklet__active"
  end
  def chicklet_class(page, current_page), do: ""
end
