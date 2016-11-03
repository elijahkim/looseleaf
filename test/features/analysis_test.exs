defmodule Looseleaf.AnalysisFeatureTest do
  use Looseleaf.AcceptanceCase
  import Looseleaf.Factory
  alias Looseleaf.FeatureTestHelpers

  test "A guest is redirected to the root path", %{session: session} do
    path =
      session
      |> visit("/analysis")
      |> get_current_path

    assert path == "/"
  end

  test "A user see their analysis", %{session: session} do
    user = insert(:user)
    path =
      session
      |> FeatureTestHelpers.sign_in_user(user)
      |> visit("/analysis")
      |> get_current_path

    assert path == "/analysis"
  end
end
