defmodule Looseleaf.User do
  use Looseleaf.Web, :model

  schema "users" do
    field :email, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password, :password_confirmation])
    |> validate_required([:email, :password, :password_confirmation])
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
    |> validate_confirmation(:password)
    |> validate_length(:password, min: 5)
  end
end
