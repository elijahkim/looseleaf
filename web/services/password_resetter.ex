defmodule Looseleaf.PasswordResetter do
  alias Looseleaf.{Email, Mailer, User}

  def reset_password(email, repo) do
    token = random_string(10)
    user = repo.get_by(User, email: email)

    with {:ok, user}  <- add_reset_token(user, token, repo),
         email        <- Email.password_reset_email(user),
         email_struct <- Mailer.deliver_later(email) do
      {:ok, user, email_struct}
    end
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
