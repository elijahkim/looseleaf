defmodule Looseleaf.PageView do
  use Looseleaf.Web, :view

  def social_link_to(conn, social, link) do
    link(to: link, class: "about__person-social-link") do
      tag(:img, src: static_path(conn, get_asset(social)), class:
      "about__person-social-link-icon")
    end
  end

  defp get_asset(:github), do: "/images/github_icon.svg"
  defp get_asset(:twitter), do: "/images/twitter_icon.svg"
  defp get_asset(:email), do: "/images/email_icon.svg"
  defp get_asset(:linked_in), do: "/images/linkedin_icon.svg"
  defp get_asset(:instagram), do: "/images/instagram_icon.svg"
end
