defmodule Furnishing.SubscriptionTest do
  use Furnishing.DataCase

  alias Furnishing.Subscription

  describe "subscription_plans" do
    alias Furnishing.Subscription.SubscriptionPlan

    import Furnishing.SubscriptionFixtures

    @invalid_attrs %{active: nil, version: nil, user_id: nil, plan_type: nil}

    test "list_subscription_plans/0 returns all subscription_plans" do
      subscription_plan = subscription_plan_fixture()
      assert Subscription.list_subscription_plans() == [subscription_plan]
    end

    test "get_subscription_plan!/1 returns the subscription_plan with given id" do
      subscription_plan = subscription_plan_fixture()
      assert Subscription.get_subscription_plan!(subscription_plan.id) == subscription_plan
    end

    test "create_subscription_plan/1 with valid data creates a subscription_plan" do
      valid_attrs = %{active: true, version: "7488a646-e31f-11e4-aace-600308960662", user_id: 42, plan_type: :basic}

      assert {:ok, %SubscriptionPlan{} = subscription_plan} = Subscription.create_subscription_plan(valid_attrs)
      assert subscription_plan.active == true
      assert subscription_plan.version == "7488a646-e31f-11e4-aace-600308960662"
      assert subscription_plan.user_id == 42
      assert subscription_plan.plan_type == :basic
    end

    test "create_subscription_plan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Subscription.create_subscription_plan(@invalid_attrs)
    end

    test "update_subscription_plan/2 with valid data updates the subscription_plan" do
      subscription_plan = subscription_plan_fixture()
      update_attrs = %{active: false, version: "7488a646-e31f-11e4-aace-600308960668", user_id: 43, plan_type: :premium}

      assert {:ok, %SubscriptionPlan{} = subscription_plan} = Subscription.update_subscription_plan(subscription_plan, update_attrs)
      assert subscription_plan.active == false
      assert subscription_plan.version == "7488a646-e31f-11e4-aace-600308960668"
      assert subscription_plan.user_id == 43
      assert subscription_plan.plan_type == :premium
    end

    test "update_subscription_plan/2 with invalid data returns error changeset" do
      subscription_plan = subscription_plan_fixture()
      assert {:error, %Ecto.Changeset{}} = Subscription.update_subscription_plan(subscription_plan, @invalid_attrs)
      assert subscription_plan == Subscription.get_subscription_plan!(subscription_plan.id)
    end

    test "delete_subscription_plan/1 deletes the subscription_plan" do
      subscription_plan = subscription_plan_fixture()
      assert {:ok, %SubscriptionPlan{}} = Subscription.delete_subscription_plan(subscription_plan)
      assert_raise Ecto.NoResultsError, fn -> Subscription.get_subscription_plan!(subscription_plan.id) end
    end

    test "change_subscription_plan/1 returns a subscription_plan changeset" do
      subscription_plan = subscription_plan_fixture()
      assert %Ecto.Changeset{} = Subscription.change_subscription_plan(subscription_plan)
    end
  end
end
