# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FoodTruck.Repo.insert!(%FoodTruck.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

seed_file = "priv/repo/Mobile_Food_Facility_Permit.csv"

FoodTruck.Faclities.Location.load_csv(seed_file)

# > {:ok, loc} = seed_file |> File.stream!([], 1000) |> CSV.decode(headers: true) |> Enum.fetch!(1)
# {:ok,
#  %{
#    "Address" => "Assessors Block 7283/Lot004",
#    "Applicant" => "Casita Vegana",
#    "Approved" => "11/05/2021 12:00:00 AM",
#    "ExpirationDate" => "11/15/2022 12:00:00 AM",
#    "FacilityType" => "Truck",
#    "Fire Prevention Districts" => "1",
#    "FoodItems" => "Coffee: Vegan Pastries: Vegan Hot Dogs: Vegan Tamales: Te: Vegan Shakes",
#    "Latitude" => "37.72188970870838",
#    "Location" => "(37.72188970870838, -122.4925212449949)",
#    "LocationDescription" => "JOHN MUIR DR: LAKE MERCED BLVD to SKYLINE BLVD (200 - 699)",
#    "Longitude" => "-122.4925212449949",
#    "NOISent" => "",
#    "Neighborhoods (old)" => "14",
#    "Police Districts" => "8",
#    "PriorPermit" => "0",
#    "Received" => "20211105",
#    "Schedule" => "http://bsm.sfdpw.org/PermitsTracker/reports/report.aspx?title=schedule&report=rptSchedule&params=permit=21MFF-00105&ExportPDF=1&Filename=21MFF-00105_schedule.pdf",
#    "Status" => "APPROVED",
#    "Supervisor Districts" => "4",
#    "X" => "5985417.15",
#    "Y" => "2091453.145",
#    "Zip Codes" => "64",
#    "block" => "7283",
#    "blocklot" => "7283004",
#    "cnn" => "7553000",
#    "dayshours" => "",
#    "locationid" => "1569145",
#    "lot" => "004",
#    "permit" => "21MFF-00105"
#  }}
# iex(9)> loc["Applicant"]
# "Casita Vegana"
