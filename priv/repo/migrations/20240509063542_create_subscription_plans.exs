defmodule Furnishing.Repo.Migrations.CreateSubscriptionPlans do
  use Ecto.Migration

  def change do
    create table(:subscription_plans) do
      add :user_id, references(:users)
      add :plan_type, :string
      add :version, :uuid
      add :active, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
