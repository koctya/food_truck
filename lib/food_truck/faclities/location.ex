defmodule FoodTruck.Faclities.Location do
  use Ecto.Schema
  import Ecto.Changeset
  alias FoodTruck.{Faclities, Faclities.Location, Repo}

  schema "locations" do
    field :address, :string
    field :location_id, :string
    field :applicant, :string
    field :location_description, :string
    field :food_items, :string
    field :latitude, :string
    field :longitude, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:location_id, :applicant, :location_description, :address, :food_items, :latitude, :longitude])
    |> validate_required([:location_id, :applicant, :address, :latitude, :longitude])
    |> unique_constraint(:location_id)
  end


  def load_csv(file) do

    file
    |> File.stream!()
    |> CSV.decode(headers: true)
    |> Enum.map(fn row ->
      row
      |> dbg()
      |> create_or_skip()
    end)
  end

  # defp create({:ok, row}) do
  #     Faclities.create_location(%{
  #       location_id: row["locationid"],
  #       applicant: row["Applicant"],
  #       location_description: row["LocationDescription"],
  #       address: row["Address"],
  #       food_items: row["FoodItems"],
  #       latitude: row["Latitude"],
  #       longitude: row["Longitude"]
  #     })
  # end

  defp create_or_skip({:ok, row}) do
    dbg(row)
    case Repo.get_by(Location, location_id: row["locationid"]) do
        nil ->
          Faclities.create_location(%{
            location_id: row["locationid"],
            applicant: row["Applicant"],
            location_description: row["LocationDescription"],
            address: row["Address"],
            food_items: row["FoodItems"],
            latitude: row["Latitude"],
            longitude: row["Longitude"]
          })

          location ->
          {:ok, location}
      end
  end
end
