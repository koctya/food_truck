defmodule FoodTruck.FaclitiesTest do
  use FoodTruck.DataCase

  alias FoodTruck.Faclities

  describe "locations" do
    alias FoodTruck.Faclities.Location

    import FoodTruck.FaclitiesFixtures

    @invalid_attrs %{address: nil, location_id: nil, applicant: nil, location_description: nil, food_items: nil, latitude: nil, longitude: nil}

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Faclities.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Faclities.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      valid_attrs = %{address: "some address", location_id: "some location_id", applicant: "some applicant", location_description: "some location_description", food_items: "some food_items", latitude: "some latitude", longitude: "some longitude"}

      assert {:ok, %Location{} = location} = Faclities.create_location(valid_attrs)
      assert location.address == "some address"
      assert location.location_id == "some location_id"
      assert location.applicant == "some applicant"
      assert location.location_description == "some location_description"
      assert location.food_items == "some food_items"
      assert location.latitude == "some latitude"
      assert location.longitude == "some longitude"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Faclities.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      update_attrs = %{address: "some updated address", location_id: "some updated location_id", applicant: "some updated applicant", location_description: "some updated location_description", food_items: "some updated food_items", latitude: "some updated latitude", longitude: "some updated longitude"}

      assert {:ok, %Location{} = location} = Faclities.update_location(location, update_attrs)
      assert location.address == "some updated address"
      assert location.location_id == "some updated location_id"
      assert location.applicant == "some updated applicant"
      assert location.location_description == "some updated location_description"
      assert location.food_items == "some updated food_items"
      assert location.latitude == "some updated latitude"
      assert location.longitude == "some updated longitude"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Faclities.update_location(location, @invalid_attrs)
      assert location == Faclities.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Faclities.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Faclities.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Faclities.change_location(location)
    end
  end
end
