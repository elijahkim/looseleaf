defmodule Looseleaf.PasswordResetterTest do
  use Looseleaf.ModelCase, async: true
  use Bamboo.Test
  import Looseleaf.Factory
  alias Looseleaf.Repo

  describe "reset_password(user, repo)" do
    test "it sets a token to edit a password" do
      user = insert(:user)

      {:ok, user, _email} = Looseleaf.PasswordResetter.reset_password(user.email, Repo)

      assert user.password_reset_token != nil
    end

    test "it emails the user" do
      user = insert(:user)

      Looseleaf.PasswordResetter.reset_password(user.email, Repo)

      assert_delivered_email Looseleaf.Email.password_reset_email(user)
    end
  end
end
