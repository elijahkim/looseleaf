defmodule Looseleaf.EntrySaverTest do
  use Looseleaf.ModelCase
  import Looseleaf.Factory
  alias Looseleaf.{EntrySaver, Repo}

  describe "#save_entry(entry_params, user, repo)" do
    setup do
      user = insert(:user)

      {:ok, %{user: user}}
    end

    test "It saves the entry with the user", %{user: user} do
      entry_params = %{"text" => "hello world"}

      {:ok, entry} = EntrySaver.save_entry(entry_params, user, Repo)

      assert entry.user_id == user.id
    end

    test "It saves the sentiment analysis", %{user: user} do
      entry_params = %{"text" => "hello world"}

      {:ok, entry} = EntrySaver.save_entry(entry_params, user, Repo)

      assert entry.sentiment_analysis
    end
  end
end
