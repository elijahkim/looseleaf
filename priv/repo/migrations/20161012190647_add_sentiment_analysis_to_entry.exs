defmodule Looseleaf.Repo.Migrations.AddSentimentAnalysisToEntry do
  use Ecto.Migration

  def change do
    alter table(:entries) do
      add :sentiment_analysis, {:array, :map}
      modify :text, :text
    end
  end
end
