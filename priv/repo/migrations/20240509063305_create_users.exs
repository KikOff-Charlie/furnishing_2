defmodule Furnishing.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :password_digest, :string
      add :company_name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
