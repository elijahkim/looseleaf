defmodule Looseleaf.Entry do
  use Looseleaf.Web, :model

  schema "entries" do
    field :text, :string
    field :sentiment_analysis, {:array, :map}
    belongs_to :user, Looseleaf.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:text, :user_id])
    |> validate_required([:text, :user_id])
  end

  def query_by_user(%{id: user_id}, query \\ Looseleaf.Entry) do
    from e in query,
      where: e.user_id == ^user_id
  end
end
