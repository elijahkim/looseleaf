defmodule Looseleaf.NewEntryTest do
  use Looseleaf.AcceptanceCase
  import Looseleaf.Factory
  alias Looseleaf.FeatureTestHelpers

  test "A guest is redirected to the root path", %{session: session} do
    path =
      session
      |> visit("/entries/new")
      |> get_current_path

    assert path == "/"
  end

  test "A user can create a new entry", %{session: session} do
    user = insert(:user)
    session =
      session
      |> FeatureTestHelpers.sign_in_user(user)
      |> visit("/entries/new")

    text =
      session
      |> find(".new-entry__label")
      |> text

    assert String.contains?(text, "What's up")

    path =
      session
      |> fill_in("entry_text", with: "This is my entry")
      |> click_on("Finish")
      |> get_current_path

    assert path == "/entries/success"
  end
end
