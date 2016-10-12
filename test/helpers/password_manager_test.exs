defmodule Looseleaf.PasswordManagerTest do
  use Looseleaf.ModelCase
  import Looseleaf.Factory
  alias Looseleaf.{Repo, PasswordManager}

  describe "#authorize" do
    setup do
      user = insert(:user)

      {:ok, %{user: user}}
    end

    test "It returns {:ok, user} on success", %{user: user} do
      params = %{"email" => user.email, "password" => "supersecret"}

      actual = PasswordManager.check(params, Repo)

      assert {:ok, user} = actual
    end

    test "It returns {:error, :wrong_combination on failure", %{user: user} do
      params = %{"email" => user.email, "password" => "superwrong"}

      actual = PasswordManager.check(params, Repo)

      assert {:error, :wrong_combination} = actual
    end
  end
end
