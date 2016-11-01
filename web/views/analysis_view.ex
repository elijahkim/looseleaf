defmodule Looseleaf.AnalysisView do
  use Looseleaf.Web, :view

  def remaining_entries(entries) do
    case 3 - length(entries) do
      1 -> "1 more entry"
      count -> "#{count} more entries"
    end
  end
end
