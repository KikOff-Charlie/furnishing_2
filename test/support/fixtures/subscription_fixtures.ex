defmodule Furnishing.SubscriptionFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Furnishing.Subscription` context.
  """

  @doc """
  Generate a subscription_plan.
  """
  def subscription_plan_fixture(attrs \\ %{}) do
    {:ok, subscription_plan} =
      attrs
      |> Enum.into(%{
        active: true,
        plan_type: :basic,
        user_id: 42,
        version: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> Furnishing.Subscription.create_subscription_plan()

    subscription_plan
  end
end
