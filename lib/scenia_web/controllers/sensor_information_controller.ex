defmodule SceniaWeb.SensorInformationController do
  use SceniaWeb, :controller

  alias Scenia.Sensor
  alias Scenia.Sensor.SensorInformation

  action_fallback SceniaWeb.FallbackController

  def index(conn, _params) do
    sensor_informations = Sensor.list_sensor_informations()
    render(conn, "show.json", sensor_information: sensor_informations)
  end

  def create(conn, %{"sensor_information" => sensor_information_params}) do
    with {:ok, %SensorInformation{} = sensor_information} <- Sensor.create_sensor_information(sensor_information_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.sensor_information_path(conn, :show, sensor_information))
      |> render("show.json", sensor_information: sensor_information)
    end
  end

  def show(conn, %{"id" => id}) do
    sensor_information = Sensor.get_sensor_information!(id)
    render(conn, "show.json", sensor_information: sensor_information)
  end

  def update(conn, %{"id" => id, "sensor_information" => sensor_information_params}) do
    sensor_information = Sensor.get_sensor_information!(id)

    with {:ok, %SensorInformation{} = sensor_information} <- Sensor.update_sensor_information(sensor_information, sensor_information_params) do
      render(conn, "show.json", sensor_information: sensor_information)
    end
  end

  def delete(conn, %{"id" => id}) do
    sensor_information = Sensor.get_sensor_information!(id)

    with {:ok, %SensorInformation{}} <- Sensor.delete_sensor_information(sensor_information) do
      send_resp(conn, :no_content, "")
    end
  end
end
