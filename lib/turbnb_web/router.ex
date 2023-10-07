defmodule TurbnbWeb.Router do
  use TurbnbWeb, :router

  import TurbnbWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {TurbnbWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  ## Authentication routes

  scope "/", TurbnbWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    live_session :redirect_if_user_is_authenticated,
      on_mount: [{TurbnbWeb.UserAuth, :redirect_if_user_is_authenticated}] do
      live "/users/log_in", UserLoginLive, :new
    end

    post "/users/log_in", UserSessionController, :create
  end

  scope "/", TurbnbWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [{TurbnbWeb.UserAuth, :ensure_authenticated}] do
      live "/users/settings", UserSettingsLive, :edit
    end
  end

  scope "/", TurbnbWeb do
    pipe_through [:browser]

    live "/", LandingLive

    delete "/users/log_out", UserSessionController, :delete
  end
end
