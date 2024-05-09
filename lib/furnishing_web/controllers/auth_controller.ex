defmodule FurnishingWeb.AuthController do
  use FurnishingWeb, :controller

  alias Furnishing.Accounts

  def signup(conn, %{"email" => email, "password" => password}) do
    case Accounts.create_user(%{"email" => email, "password" => password}) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome!")
        |> render(:index, user: user)

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:error, "Oops, something went wrong!")
        |> render("signup.html", changeset: changeset)
    end
  end
end
