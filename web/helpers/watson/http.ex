defmodule Looseleaf.Watson.Http do
  @base_url "https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19"
  @auth [
    hackney: [
      basic_auth: {"ff83cc8f-392b-4e9a-b301-c4177bcda54a", "0jBXgJKfH4tA"},
    ]
  ]
  @headers %{
    "Content-Type" => "application/json"
  }

  def analyze_tone(text) do
    body = %{text: text} |> Poison.encode!

    case HTTPoison.post(@base_url, body, @headers, @auth) do
      {:ok, response} -> parse_body(response.body)
      {:error, error} -> {:error, error}
    end
  end

  defp parse_body(body) do
    {:ok, body} = Poison.decode(body)
    [doc_tone | tail] = body["document_tone"]["tone_categories"]
    {:ok, doc_tone["tones"]}
  end
end
