defmodule Furnishing.Repo.Migrations.CreateInvoices do
  use Ecto.Migration

  def change do
    create table(:invoices) do
      add :user_id, references(:users)
      add :subscription_plan_id, references(:subscription_plans)
      add :amount_cents, :integer
      add :currant_balance_cents, :integer
      add :start_at, :utc_datetime
      add :end_start, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end
