defmodule SceniaWeb.sensors_informationController do
  use SceniaWeb, :controller

  alias Scenia.Sensor
  alias Scenia.Sensor.sensors_information

  action_fallback SceniaWeb.FallbackController

  def index(conn, _params) do
    sensors_information = Sensor.list_sensors_information()
    render(conn, "index.json", sensors_information: sensors_information)
  end

  def create(conn, %{"sensors_information" => sensors_information_params}) do
    with {:ok, %sensors_information{} = sensors_information} <- Sensor.create_sensors_information(sensors_information_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.sensors_information_path(conn, :show, sensors_information))
      |> render("show.json", sensors_information: sensors_information)
    end
  end

  def show(conn, %{"id" => id}) do
    sensors_information = Sensor.get_sensors_information!(id)
    render(conn, "show.json", sensors_information: sensors_information)
  end

  def update(conn, %{"id" => id, "sensors_information" => sensors_information_params}) do
    sensors_information = Sensor.get_sensors_information!(id)

    with {:ok, %sensors_information{} = sensors_information} <- Sensor.update_sensors_information(sensors_information, sensors_information_params) do
      render(conn, "show.json", sensors_information: sensors_information)
    end
  end

  def delete(conn, %{"id" => id}) do
    sensors_information = Sensor.get_sensors_information!(id)

    with {:ok, %sensors_information{}} <- Sensor.delete_sensors_information(sensors_information) do
      send_resp(conn, :no_content, "")
    end
  end
end
