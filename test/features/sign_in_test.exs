defmodule Looseleaf.SignInTest do
  use Looseleaf.AcceptanceCase, async: true

  test "A guest is redirected to the sign in page", %{session: session} do
    text =
      session
      |> visit("/profile")
      |> find(".alert-danger")
      |> text

    assert text == "Please Sign in"
  end
end
