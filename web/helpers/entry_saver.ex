defmodule Looseleaf.EntrySaver do
  import Ecto.Changeset, only: [put_change: 3]
  alias Looseleaf.{User, Entry, Watson}

  def save_entry(%{"text" => text} = entry_params, user, repo) do
    entry_params = entry_params |> Map.put("user_id", user.id)
    changeset = Entry.changeset(%Entry{}, entry_params)

    if changeset.valid? do
      {:ok, analysis} = Watson.analyze_tone(text)
      changeset
      |> put_change(:sentiment_analysis, analysis)
      |> repo.insert
    else
      {:error, changeset}
    end
  end
end
