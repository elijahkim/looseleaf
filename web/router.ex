defmodule Looseleaf.Router do
  use Looseleaf.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :browser_authenticated do
    plug Guardian.Plug.EnsureAuthenticated,
      handler: Looseleaf.AuthorizationController
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Unauthenticated Routes
  scope "/", Looseleaf do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Authenticated Routes
  scope "/", Looseleaf do
    pipe_through [:browser, :browser_session, :browser_authenticated]

    get "/profile", PageController, :index
  end
end
