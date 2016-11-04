defmodule Looseleaf.PasswordResetter do
  alias Looseleaf.User

  def reset_password(user, repo) do
    token = random_string(10)

    user
    |> add_reset_token(token, repo)
  end

  defp add_reset_token(user, token, repo) do
    user
    |> User.password_reset_token_changeset(%{password_reset_token: token})
    |> repo.update
  end

  def random_string(length) do
    :crypto.strong_rand_bytes(length)
    |> Base.url_encode64
    |> binary_part(0, length)
  end
end
