defmodule Looseleaf.EmailTest do
  use Looseleaf.ModelCase
  import Looseleaf.Factory

  describe "#send_password_reset" do
    test "it sends a password reset email" do
      user = insert(:user)
      email = Looseleaf.Email.password_reset_email(user)

      assert email.to == user.email
      assert email.text_body =~ "Click here to reset your password"
    end
  end
end
