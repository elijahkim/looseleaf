defmodule Looseleaf.Email do
  import Bamboo.Email
  @email "us@loose-leaf.io"

  def password_reset_email(user) do
    base_email
    |> to(user.email)
    |> subject("Password Reset")
    |> text_body("Click here to reset your password")
  end

  defp base_email do
    new_email
    |> from(@email)
  end
end
