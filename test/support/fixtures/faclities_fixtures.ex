defmodule FoodTruck.FaclitiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FoodTruck.Faclities` context.
  """

  @doc """
  Generate a unique location location_id.
  """
  def unique_location_location_id, do: "some location_id#{System.unique_integer([:positive])}"

  @doc """
  Generate a location.
  """
  def location_fixture(attrs \\ %{}) do
    {:ok, location} =
      attrs
      |> Enum.into(%{
        address: "some address",
        applicant: "some applicant",
        food_items: "some food_items",
        latitude: "some latitude",
        location_description: "some location_description",
        location_id: unique_location_location_id(),
        longitude: "some longitude"
      })
      |> FoodTruck.Faclities.create_location()

    location
  end
end
