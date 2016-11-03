defmodule Looseleaf.FeatureTestHelpers do
  use Wallaby.DSL

  def sign_in_user(session, %{email: email}) do
    session
    |> visit("/sessions/new")
    |> fill_in("Email", with: email)
    |> fill_in("Password", with: "supersecret")
    |> click_on("Log In")
  end
end
