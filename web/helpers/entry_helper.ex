defmodule Looseleaf.EntryHelper do
  def assemble_chart_data(entries) do
    initial_accum = %{
      "anger" => [],
      "disgust" => [],
      "fear" => [],
      "joy" => [],
      "sadness" => [],
    }

    Enum.reduce(entries, initial_accum, &(do_work/2))
  end

  defp do_work(%{sentiment_analysis: sentiment_analysis}, acc) do
    attach_score(sentiment_analysis, acc)
  end

  defp attach_score(nil, acc), do: acc
  defp attach_score([%{"score" => score, "tone_id" => tone}], acc) do
    scores = acc[tone]
    scores = [score|scores]
    acc = Map.put(acc, tone, scores)
  end
  defp attach_score([%{"score" => score, "tone_id" => tone}|tail], acc) do
    scores = acc[tone]
    scores = [score|scores]
    acc = Map.put(acc, tone, scores)
    attach_score(tail, acc)
  end
end
