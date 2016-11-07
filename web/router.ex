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
    pipe_through [:browser, :browser_session]

    get "/", PageController, :index
    get "/about-us", PageController, :about_us

    resources "/users", UserController, only: [:new, :create]
    resources "/sessions", SessionController, only: [:new, :create]
    resources "/password_reset", PasswordResetController, only: [:create]
  end

  # Authenticated Routes
  scope "/", Looseleaf do
    pipe_through [:browser, :browser_session, :browser_authenticated]

    get "/profile", ProfileController, :index
    get "/entries/success", EntryController, :success
    resources "/sessions", SessionController, only: [:delete]
    resources "/entries", EntryController, only: [:new, :create]
    resources "/analysis", AnalysisController, only: [:index]
    resources "/tutorial", TutorialController, only: [:show]
  end
end
