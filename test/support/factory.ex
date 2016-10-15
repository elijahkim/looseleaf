defmodule Looseleaf.Factory do
  use ExMachina.Ecto, repo: Looseleaf.Repo
  alias Looseleaf.{User, Entry}

  def user_factory do
    %User{
      email: sequence(:email, &"email-#{&1}@example.com"),
      encrypted_password: Comeonin.Bcrypt.hashpwsalt("supersecret"),
    }
  end

  def entry_factory do
    %Entry{
      text: "hi",
      sentiment_analysis: [
        %{"score" => 0.372707, "tone_id" => "anger", "tone_name" => "Anger"},
        %{"score" => 0.142728, "tone_id" => "disgust", "tone_name" => "Disgust"},
        %{"score" => 0.11959, "tone_id" => "fear", "tone_name" => "Fear"},
        %{"score" => 0.009372, "tone_id" => "joy", "tone_name" => "Joy"},
        %{"score" => 0.533912, "tone_id" => "sadness", "tone_name" => "Sadness"}
      ]
    }
  end
end
