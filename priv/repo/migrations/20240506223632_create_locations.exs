defmodule FoodTruck.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :location_id, :string
      add :applicant, :string
      add :location_description, :string
      add :address, :string
      add :food_items, :string
      add :latitude, :string
      add :longitude, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:locations, [:location_id])
  end
end
