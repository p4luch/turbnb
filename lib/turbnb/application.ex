defmodule Turbnb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TurbnbWeb.Telemetry,
      # Start the Ecto repository
      Turbnb.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Turbnb.PubSub},
      # Start the Endpoint (http/https)
      TurbnbWeb.Endpoint
      # Start a worker by calling: Turbnb.Worker.start_link(arg)
      # {Turbnb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Turbnb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TurbnbWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
