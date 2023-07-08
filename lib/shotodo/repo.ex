defmodule Shotodo.Repo do
  use Ecto.Repo,
    otp_app: :shotodo,
    adapter: Ecto.Adapters.Postgres
end
