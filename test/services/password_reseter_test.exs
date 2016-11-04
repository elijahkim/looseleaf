defmodule Looseleaf.PasswordResetterTest do
  use Looseleaf.ModelCase, async: true
  import Looseleaf.Factory
  alias Looseleaf.Repo

  describe "reset_password(user, repo)" do
    test "it sets a token to edit a password" do
      user = insert(:user)

      {:ok, user} = Looseleaf.PasswordResetter.reset_password(user, Repo)
      assert user.password_reset_token != nil
    end
  end
end
