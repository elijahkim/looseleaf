defmodule Looseleaf.PasswordResetControllerTest do
  use Looseleaf.ConnCase
  import Looseleaf.Factory
  alias Looseleaf.{Repo, User}

  describe "POST /password_reset" do
    test "valid args", %{conn: conn} do
      user = insert(:user)
      conn = post conn, "/password_reset", %{email: user.email}

      assert html_response(conn, 302)
    end

    test "it creates a password reset token for the user", %{conn: conn} do
      user = insert(:user)
      post conn, "/password_reset", %{email: user.email}

      user = Repo.get(User, user.id)
      assert user.password_reset_token != nil
    end
  end
end
