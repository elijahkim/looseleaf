defmodule Looseleaf.EntryTest do
  use Looseleaf.ModelCase
  import Looseleaf.Factory
  alias Looseleaf.Entry

  @valid_attrs %{text: "some content", user_id: 1}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Entry.changeset(%Entry{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Entry.changeset(%Entry{}, @invalid_attrs)
    refute changeset.valid?
  end

  describe "#query_by_user(user)" do
    setup do
      user = insert(:user)
      {:ok, %{user: user}}
    end

    test "it builds a query for the last 10 entries from a user", %{user: %{id: user_id}} do
      actual = Entry.query_by_user(user_id)
      expected = from e in Looseleaf.Entry, where: e.user_id == ^user_id

      assert expected == actual
    end
  end
end
