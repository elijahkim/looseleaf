ExUnit.start

Ecto.Adapters.SQL.Sandbox.mode(Looseleaf.Repo, :manual)
{:ok, _} = Application.ensure_all_started(:ex_machina)
{:ok, _} = Application.ensure_all_started(:wallaby)
