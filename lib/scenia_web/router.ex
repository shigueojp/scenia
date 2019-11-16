defmodule SceniaWeb.Router do
  use SceniaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SceniaWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit,:delete]
    resources "/module", ModuleController, except: [:new, :edit]
    resources "/sensor_informations", SensorInformationController, except: [:new, :edit]

    post "/users/login", UserController, :login
  end
end
#[:index, :edit, :new, :show, :create, :update, :delete]
