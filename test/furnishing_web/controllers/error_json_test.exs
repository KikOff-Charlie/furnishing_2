defmodule FurnishingWeb.ErrorJSONTest do
  use FurnishingWeb.ConnCase, async: true

  test "renders 404" do
    assert FurnishingWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert FurnishingWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
