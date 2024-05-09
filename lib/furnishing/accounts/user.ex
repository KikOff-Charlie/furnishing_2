defmodule Furnishing.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :password_digest, :string
    field :company_name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password_digest, :company_name])
    |> validate_required([:email, :password_digest, :company_name])
  end
end
