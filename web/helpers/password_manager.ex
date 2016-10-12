defmodule Looseleaf.PasswordManager do
  alias Looseleaf.{User}

  def check(%{"email" => email, "password" => password}, repo) do
    user = repo.get_by(User, email: email)

    if Comeonin.Bcrypt.checkpw(password, user.encrypted_password) do
      {:ok, user}
    else
      {:error, :wrong_combination}
    end
  end
end
