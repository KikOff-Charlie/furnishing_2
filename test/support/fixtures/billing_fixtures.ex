defmodule Furnishing.BillingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Furnishing.Billing` context.
  """

  @doc """
  Generate a invoice.
  """
  def invoice_fixture(attrs \\ %{}) do
    {:ok, invoice} =
      attrs
      |> Enum.into(%{
        amount_cents: 42,
        currant_balance_cents: 42,
        end_start: ~U[2024-05-08 06:39:00Z],
        start_at: ~U[2024-05-08 06:39:00Z],
        subscription_plan_id: 42,
        user_id: 42
      })
      |> Furnishing.Billing.create_invoice()

    invoice
  end
end
