defmodule Looseleaf.TutorialController do
  use Looseleaf.Web, :controller

  def show(conn, %{"id" => id}) do
    id = String.to_integer(id)

    case get_assets(id) do
      false -> redirect(conn, to: entry_path(conn, :new))
      assets -> render(conn, "show.html", assets: assets, id: id)
    end
  end

  defp get_assets(1) do
    %{
      text: "Journaling facilitates the processing of our thoughts. Psychology
      studies show that this practice has a positive impact on stress and
      anxiety levels",
      image: "/images/tutorial_icon1.svg",
      header: "Why journal?"
    }
  end
  defp get_assets(2) do
    %{
      text: "By the time we finish a journal entry, most of the benefits have
      already been achieved. So we figured, why hold onto them?",
      image: "/images/tutorial_icon2.svg",
      header: "Tell me more..."
    }
  end
  defp get_assets(3) do
    %{
      text: "The journaling app allows you to externalize and release these
      thoughts to prevent being weighed down by nagive thoughts or privary
      concerns.",
      image: "/images/tutorial_icon3.svg",
      header: "Why will entries disappear?"
    }
  end
  defp get_assets(4) do
    %{
      text: "Before your journal entries disappear, we process the text to
      identify interesting patterns to help track your stress and anxiety",
      image: "/images/tutorial_icon4.svg",
      header: "What happens to entries?"
    }
  end
  defp get_assets(_), do: false
end
