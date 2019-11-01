defmodule SceniaWeb.SensorInformationView do
  use SceniaWeb, :view
  alias SceniaWeb.SensorInformationView

  def render("index.json", %{sensor_informations: sensor_informations}) do
    %{data: render_many(sensor_informations, SensorInformationView, "sensor_information.json")}
  end

  def render("show.json", %{sensor_information: sensor_information}) do
    %{data: render_one(sensor_information, SensorInformationView, "sensor_information.json")}
  end

  def render("sensor_information.json", %{sensor_information: sensor_information}) do
    %{
      id: sensor_information.id,
      A1: sensor_information."A1",
      A2: sensor_information."A2",
      A3: sensor_information."A3",
      freq1: sensor_information.freq1,
      freq2: sensor_information.freq2,
      freq3: sensor_information.freq3,
      Irms: sensor_information."Irms",
      Vrms: sensor_information."Vrms"
    }
  end
end
