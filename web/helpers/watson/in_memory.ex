defmodule Looseleaf.Watson.InMemory do
  def analyze_tone(_) do
    {:ok,
      [%{"score" => 0.349214, "tone_id" => "anger", "tone_name" => "Anger"},
        %{"score" => 0.217595, "tone_id" => "disgust", "tone_name" =>
          "Disgust"},
        %{"score" => 0.233523, "tone_id" => "fear", "tone_name" => "Fear"},
        %{"score" => 0.165414, "tone_id" => "joy", "tone_name" => "Joy"},
        %{"score" => 0.078053, "tone_id" => "sadness", "tone_name" => "Sadness"}
      ]
    }
  end
end
