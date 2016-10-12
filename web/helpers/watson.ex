defmodule Looseleaf.Watson do
  @client Application.get_env(:looseleaf, :watson_client)

  defdelegate analyze_tone(text), to: @client
end
