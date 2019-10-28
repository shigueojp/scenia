defmodule SceniaWeb.SensorInformationControllerTest do
  use SceniaWeb.ConnCase

  alias Scenia.Sensor
  alias Scenia.Sensor.SensorInformation

  @create_attrs %{
    A1: 120.5,
    A2: 120.5,
    A3: 120.5,
    Irms: 120.5,
    Vrms: 120.5,
    freq1: 120.5,
    freq2: 120.5,
    freq3: 120.5
  }
  @update_attrs %{
    A1: 456.7,
    A2: 456.7,
    A3: 456.7,
    Irms: 456.7,
    Vrms: 456.7,
    freq1: 456.7,
    freq2: 456.7,
    freq3: 456.7
  }
  @invalid_attrs %{A1: nil, A2: nil, A3: nil, Irms: nil, Vrms: nil, freq1: nil, freq2: nil, freq3: nil}

  def fixture(:sensor_information) do
    {:ok, sensor_information} = Sensor.create_sensor_information(@create_attrs)
    sensor_information
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sensor_informations", %{conn: conn} do
      conn = get(conn, Routes.sensor_information_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sensor_information" do
    test "renders sensor_information when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sensor_information_path(conn, :create), sensor_information: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.sensor_information_path(conn, :show, id))

      assert %{
               "id" => id,
               "A1" => 120.5,
               "A2" => 120.5,
               "A3" => 120.5,
               "Irms" => 120.5,
               "Vrms" => 120.5,
               "freq1" => 120.5,
               "freq2" => 120.5,
               "freq3" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sensor_information_path(conn, :create), sensor_information: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sensor_information" do
    setup [:create_sensor_information]

    test "renders sensor_information when data is valid", %{conn: conn, sensor_information: %SensorInformation{id: id} = sensor_information} do
      conn = put(conn, Routes.sensor_information_path(conn, :update, sensor_information), sensor_information: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.sensor_information_path(conn, :show, id))

      assert %{
               "id" => id,
               "A1" => 456.7,
               "A2" => 456.7,
               "A3" => 456.7,
               "Irms" => 456.7,
               "Vrms" => 456.7,
               "freq1" => 456.7,
               "freq2" => 456.7,
               "freq3" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, sensor_information: sensor_information} do
      conn = put(conn, Routes.sensor_information_path(conn, :update, sensor_information), sensor_information: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sensor_information" do
    setup [:create_sensor_information]

    test "deletes chosen sensor_information", %{conn: conn, sensor_information: sensor_information} do
      conn = delete(conn, Routes.sensor_information_path(conn, :delete, sensor_information))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.sensor_information_path(conn, :show, sensor_information))
      end
    end
  end

  defp create_sensor_information(_) do
    sensor_information = fixture(:sensor_information)
    {:ok, sensor_information: sensor_information}
  end
end
