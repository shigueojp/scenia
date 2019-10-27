defmodule SceniaWeb.ModuleController do
  use SceniaWeb, :controller

  alias Scenia.Sensor
  alias Scenia.Sensor.Module

  action_fallback SceniaWeb.FallbackController

  def index(conn, _params) do
    module = Sensor.list_module()
    render(conn, "index.json", module: module)
  end

  def create(conn, %{"module" => module_params}) do
    with {:ok, %Module{} = module} <- Sensor.create_module(module_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.module_path(conn, :show, module))
      |> render("show.json", module: module)
    end
  end

  def show(conn, %{"id" => id}) do
    module = Sensor.get_module!(id)
    render(conn, "show.json", module: module)
  end

  def update(conn, %{"id" => id, "module" => module_params}) do
    module = Sensor.get_module!(id)

    with {:ok, %Module{} = module} <- Sensor.update_module(module, module_params) do
      render(conn, "show.json", module: module)
    end
  end

  def delete(conn, %{"id" => id}) do
    module = Sensor.get_module!(id)

    with {:ok, %Module{}} <- Sensor.delete_module(module) do
      send_resp(conn, :no_content, "")
    end
  end
end
