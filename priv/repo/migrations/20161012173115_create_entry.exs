defmodule Looseleaf.Repo.Migrations.CreateEntry do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :text, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:entries, [:user_id])

  end
end
