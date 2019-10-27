defmodule SceniaWeb.sensors_informationControllerTest do
  use SceniaWeb.ConnCase

  alias Scenia.Sensor
  alias Scenia.Sensor.sensors_information

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

  def fixture(:sensors_information) do
    {:ok, sensors_information} = Sensor.create_sensors_information(@create_attrs)
    sensors_information
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sensors_information", %{conn: conn} do
      conn = get(conn, Routes.sensors_information_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create sensors_information" do
    test "renders sensors_information when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sensors_information_path(conn, :create), sensors_information: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.sensors_information_path(conn, :show, id))

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
      conn = post(conn, Routes.sensors_information_path(conn, :create), sensors_information: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update sensors_information" do
    setup [:create_sensors_information]

    test "renders sensors_information when data is valid", %{conn: conn, sensors_information: %sensors_information{id: id} = sensors_information} do
      conn = put(conn, Routes.sensors_information_path(conn, :update, sensors_information), sensors_information: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.sensors_information_path(conn, :show, id))

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

    test "renders errors when data is invalid", %{conn: conn, sensors_information: sensors_information} do
      conn = put(conn, Routes.sensors_information_path(conn, :update, sensors_information), sensors_information: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete sensors_information" do
    setup [:create_sensors_information]

    test "deletes chosen sensors_information", %{conn: conn, sensors_information: sensors_information} do
      conn = delete(conn, Routes.sensors_information_path(conn, :delete, sensors_information))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.sensors_information_path(conn, :show, sensors_information))
      end
    end
  end

  defp create_sensors_information(_) do
    sensors_information = fixture(:sensors_information)
    {:ok, sensors_information: sensors_information}
  end
end
