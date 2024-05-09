defmodule Furnishing.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Furnishing.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        company_name: "some company_name",
        email: "some email",
        password_digest: "some password_digest"
      })
      |> Furnishing.Accounts.create_user()

    user
  end
end
