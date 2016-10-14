defmodule Looseleaf.PasswordManager do
  alias Looseleaf.{User}

  def check(%{"email" => email, "password" => password}, repo) do
    repo.get_by(User, email: email)
    |> check_password(password)
  end

  defp check_password(nil, _password_guess), do: {:error, :wrong_combination}
  defp check_password(%{encrypted_password: encrypted_password} = user, password_guess) do
    if Comeonin.Bcrypt.checkpw(password_guess, encrypted_password) do
      {:ok, user}
    else
      {:error, :wrong_combination}
    end
  end
end
