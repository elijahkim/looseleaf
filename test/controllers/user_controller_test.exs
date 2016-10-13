defmodule Looseleaf.UserControllerTest do
  use Looseleaf.ConnCase

  test "GET /users/new", %{conn: conn} do
    conn = get conn, "/users/new"
    assert html_response(conn, 200) =~ "Sign Up"
  end

  describe "POST /users" do
    test "valid args", %{conn: conn} do
      conn = post conn, "/users", %{
        user: %{
          email: "user@example.com",
          password: "supersecret",
          password_confirmation: "supersecret",
        }
      }

      assert html_response(conn, 302)
    end

    test "invalid args", %{conn: conn} do
      conn = post conn, "/users", %{
        user: %{
          email: "user",
          password: "supersecret"
        }
      }

      assert html_response(conn, 200) =~ "Unable to create account"
    end
  end
end
