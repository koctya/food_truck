defmodule FoodTruckWeb.Router do
  use FoodTruckWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {FoodTruckWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FoodTruckWeb do
    pipe_through :browser

    get "/", PageController, :home

    live "/locations", LocationLive.Index, :index
    live "/locations/new", LocationLive.Index, :new
    live "/locations/:id/edit", LocationLive.Index, :edit

    live "/locations/:id", LocationLive.Show, :show
    live "/locations/:id/show/edit", LocationLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", FoodTruckWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:food_truck, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: FoodTruckWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end

# mix ecto.create
# Compiling 20 files (.ex)
# warning: no route path for FoodTruckWeb.Router matches "/locations/#{assigns.location}"
#   lib/food_truck_web/live/location_live/show.html.heex:30: FoodTruckWeb.LocationLive.Show.render/1

# warning: no route path for FoodTruckWeb.Router matches "/locations"
#   lib/food_truck_web/live/location_live/index.html.heex:45: FoodTruckWeb.LocationLive.Index.render/1

# warning: no route path for FoodTruckWeb.Router matches "/locations"
#   lib/food_truck_web/live/location_live/index.html.heex:38: FoodTruckWeb.LocationLive.Index.render/1

# warning: no route path for FoodTruckWeb.Router matches "/locations/#{location}/edit"
#   lib/food_truck_web/live/location_live/index.html.heex:26: FoodTruckWeb.LocationLive.Index.render/1

# warning: no route path for FoodTruckWeb.Router matches "/locations/#{assigns.location}"
#   lib/food_truck_web/live/location_live/show.html.heex:23: FoodTruckWeb.LocationLive.Show.render/1

# warning: no route path for FoodTruckWeb.Router matches "/locations/#{location}"
#   lib/food_truck_web/live/location_live/index.html.heex:24: FoodTruckWeb.LocationLive.Index.render/1

# warning: no route path for FoodTruckWeb.Router matches "/locations"
#   lib/food_truck_web/live/location_live/show.html.heex:21: FoodTruckWeb.LocationLive.Show.render/1

# warning: no route path for FoodTruckWeb.Router matches "/locations/#{location}"
#   lib/food_truck_web/live/location_live/index.html.heex:13: FoodTruckWeb.LocationLive.Index.render/1

# warning: no route path for FoodTruckWeb.Router matches "/locations/#{assigns.location}/show/edit"
#   lib/food_truck_web/live/location_live/show.html.heex:5: FoodTruckWeb.LocationLive.Show.render/1

# warning: no route path for FoodTruckWeb.Router matches "/locations/new"
#   lib/food_truck_web/live/location_live/index.html.heex:4: FoodTruckWeb.LocationLive.Index.render/1
