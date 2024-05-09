defmodule Furnishing.Billing.Invoice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "invoices" do
    field :user_id, :integer
    field :subscription_plan_id, :integer
    field :amount_cents, :integer
    field :currant_balance_cents, :integer
    field :start_at, :utc_datetime
    field :end_start, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(invoice, attrs) do
    invoice
    |> cast(attrs, [:user_id, :subscription_plan_id, :amount_cents, :currant_balance_cents, :start_at, :end_start])
    |> validate_required([:user_id, :subscription_plan_id, :amount_cents, :currant_balance_cents, :start_at, :end_start])
  end
end
