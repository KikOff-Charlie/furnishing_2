defmodule Furnishing.Repo do
  use Ecto.Repo,
    otp_app: :furnishing,
    adapter: Ecto.Adapters.Postgres
end
