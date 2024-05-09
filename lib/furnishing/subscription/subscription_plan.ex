defmodule Furnishing.Subscription.SubscriptionPlan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "subscription_plans" do
    field :active, :boolean, default: false
    field :version, Ecto.UUID
    field :user_id, :integer
    field :plan_type, Ecto.Enum, values: [:basic, :premium]

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(subscription_plan, attrs) do
    subscription_plan
    |> cast(attrs, [:user_id, :plan_type, :version, :active])
    |> validate_required([:user_id, :plan_type, :version, :active])
  end
end
