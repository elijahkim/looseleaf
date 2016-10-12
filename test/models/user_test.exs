defmodule Looseleaf.UserTest do
  use Looseleaf.ModelCase

  alias Looseleaf.User

  @valid_attrs %{
    email: "user@example.com",
    password: "supersecret",
    password_confirmation: "supersecret",
  }
  @invalid_attrs_list [
    %{
      email: "user",
      password: "supersecret",
      password_confirmation: "supersecret",
    },
    %{
      email: "user",
      password: "supersecret",
    },
    %{
      email: "user",
      password: "supersecret",
      password_confirmation: "",
    },
    %{
      email: "user@example.com",
      password: "supersecret",
      password_confirmation: "super",
    },
  ]

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    Enum.each(@invalid_attrs_list, fn attrs ->
      changeset = User.changeset(%User{}, attrs)
      refute changeset.valid?
    end)
  end
end
