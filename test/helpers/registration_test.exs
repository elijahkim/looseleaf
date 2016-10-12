defmodule Looseleaf.RegistraionTest do
  use Looseleaf.ModelCase
  alias Looseleaf.{User, Registration, Repo}

  describe "#create" do
    setup do
      attrs = %{
        email: "user@example.com",
        password: "supersecret",
        password_confirmation: "supersecret",
      }

      {:ok, %{attrs: attrs}}
    end

    test "it saves the user", %{attrs: attrs} do
      changeset = User.changeset(%User{}, attrs)
      Registration.create(changeset, Repo)
      user = Repo.get_by(User, email: "user@example.com")

      assert user.email == "user@example.com"
    end

    test "it doesn't save the password", %{attrs: attrs} do
      changeset = User.changeset(%User{}, attrs)
      Registration.create(changeset, Repo)
      user = Repo.get_by(User, email: "user@example.com")

      assert user.password == nil
    end

    test "it saves an encrypted password", %{attrs: attrs} do
      changeset = User.changeset(%User{}, attrs)
      Registration.create(changeset, Repo)
      user = Repo.get_by(User, email: "user@example.com")

      refute user.encrypted_password == nil
      assert Comeonin.Bcrypt.checkpw("supersecret", user.encrypted_password)
    end
  end
end
