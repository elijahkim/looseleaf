defmodule Looseleaf.SignInTest do
  use Looseleaf.AcceptanceCase
  import Looseleaf.Factory

  test "A guest is redirected to the sign in page", %{session: session} do
    text =
      session
      |> visit("/profile")
      |> find(".home-layout__main-container")
      |> text

    assert String.contains?(text, "Loose Leaf")
  end

  test "A guest can sign up", %{session: session} do
    path =
      session
      |> visit("/")
      |> click_link("Sign Up")
      |> fill_in("Email", with: "user@example.com")
      |> fill_in("user_password", with: "supersecret")
      |> fill_in("user_password_confirmation", with: "supersecret")
      |> click_on("Sign Up")
      |> get_current_path

    assert path == "/entries/new"
  end

  test "A guest can sign in", %{session: session} do
    user = insert(:user)

    path =
      session
      |> visit("/")
      |> click_link("Log In")
      |> fill_in("Email", with: user.email)
      |> fill_in("Password", with: "supersecret")
      |> click_on("Log In")
      |> get_current_path

    assert path == "/entries/new"
  end
end
