defmodule Looseleaf.AcceptanceCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      import Ecto.Model
      import Ecto.Query, only: [from: 2]
      import Looseleaf.Router.Helpers
    end
  end

  setup tags do
    Application.put_env(:wallaby, :base_url, Looseleaf.Endpoint.url)
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Looseleaf.Repo)
    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Looseleaf.Repo, {:shared, self()})
    end
    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Looseleaf.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
