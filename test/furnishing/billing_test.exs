defmodule Furnishing.BillingTest do
  use Furnishing.DataCase

  alias Furnishing.Billing

  describe "invoices" do
    alias Furnishing.Billing.Invoice

    import Furnishing.BillingFixtures

    @invalid_attrs %{user_id: nil, subscription_plan_id: nil, amount_cents: nil, currant_balance_cents: nil, start_at: nil, end_start: nil}

    test "list_invoices/0 returns all invoices" do
      invoice = invoice_fixture()
      assert Billing.list_invoices() == [invoice]
    end

    test "get_invoice!/1 returns the invoice with given id" do
      invoice = invoice_fixture()
      assert Billing.get_invoice!(invoice.id) == invoice
    end

    test "create_invoice/1 with valid data creates a invoice" do
      valid_attrs = %{user_id: 42, subscription_plan_id: 42, amount_cents: 42, currant_balance_cents: 42, start_at: ~U[2024-05-08 06:39:00Z], end_start: ~U[2024-05-08 06:39:00Z]}

      assert {:ok, %Invoice{} = invoice} = Billing.create_invoice(valid_attrs)
      assert invoice.user_id == 42
      assert invoice.subscription_plan_id == 42
      assert invoice.amount_cents == 42
      assert invoice.currant_balance_cents == 42
      assert invoice.start_at == ~U[2024-05-08 06:39:00Z]
      assert invoice.end_start == ~U[2024-05-08 06:39:00Z]
    end

    test "create_invoice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Billing.create_invoice(@invalid_attrs)
    end

    test "update_invoice/2 with valid data updates the invoice" do
      invoice = invoice_fixture()
      update_attrs = %{user_id: 43, subscription_plan_id: 43, amount_cents: 43, currant_balance_cents: 43, start_at: ~U[2024-05-09 06:39:00Z], end_start: ~U[2024-05-09 06:39:00Z]}

      assert {:ok, %Invoice{} = invoice} = Billing.update_invoice(invoice, update_attrs)
      assert invoice.user_id == 43
      assert invoice.subscription_plan_id == 43
      assert invoice.amount_cents == 43
      assert invoice.currant_balance_cents == 43
      assert invoice.start_at == ~U[2024-05-09 06:39:00Z]
      assert invoice.end_start == ~U[2024-05-09 06:39:00Z]
    end

    test "update_invoice/2 with invalid data returns error changeset" do
      invoice = invoice_fixture()
      assert {:error, %Ecto.Changeset{}} = Billing.update_invoice(invoice, @invalid_attrs)
      assert invoice == Billing.get_invoice!(invoice.id)
    end

    test "delete_invoice/1 deletes the invoice" do
      invoice = invoice_fixture()
      assert {:ok, %Invoice{}} = Billing.delete_invoice(invoice)
      assert_raise Ecto.NoResultsError, fn -> Billing.get_invoice!(invoice.id) end
    end

    test "change_invoice/1 returns a invoice changeset" do
      invoice = invoice_fixture()
      assert %Ecto.Changeset{} = Billing.change_invoice(invoice)
    end
  end
end
