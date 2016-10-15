defmodule Looseleaf.EntryHelperTest do
  use Looseleaf.ModelCase
  import Looseleaf.Factory

  describe "#assemble_chart_data(entries)" do
    setup do
      entry_2 = build(:entry)
      entry_1 = build(:entry)
      entries = [entry_1, entry_2]

      {:ok, %{entries: entries}}
    end

    test "It returns a list of posts and their analysis", %{entries: entries} do
      actual = Looseleaf.EntryHelper.assemble_chart_data(entries)
      expected = %{
        "anger" => [0.372707, 0.372707],
        "disgust" => [0.142728, 0.142728],
        "fear" => [0.11959, 0.11959],
        "joy" => [0.009372, 0.009372],
        "sadness" => [0.533912, 0.533912],
      }

      assert expected == actual
    end
  end
end
