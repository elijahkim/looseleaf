defmodule Looseleaf.SignInTest do
  use Looseleaf.AcceptanceCase, async: true

  test "A guest is redirected to the sign in page", %{session: session} do
    text =
      session
      |> visit("/profile")
      |> find(".home__main-container")
      |> text

    assert String.contains?(text, "Loose Leaf")
  end
end
