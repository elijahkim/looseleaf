defmodule Looseleaf.Factory do
  use ExMachina.Ecto, repo: Looseleaf.Repo
  alias Looseleaf.User

  def user_factory do
    %User{
      email: sequence(:email, &"email-#{&1}@example.com"),
      encrypted_password: Comeonin.Bcrypt.hashpwsalt("supersecret"),
    }
  end
end
