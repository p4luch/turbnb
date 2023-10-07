defmodule Turbnb.Repo do
  use Ecto.Repo,
    otp_app: :turbnb,
    adapter: Ecto.Adapters.Postgres
end
