defmodule FurnishingWeb.AuthJSON do
  alias Furnishing.Accounts.User

  def index(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{id: user.id, email: user.email, company: user.company}
  end
end
