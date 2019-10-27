defmodule SceniaWeb.sensors_informationView do
  use SceniaWeb, :view
  alias SceniaWeb.sensors_informationView

  def render("index.json", %{sensors_information: sensors_information}) do
    %{data: render_many(sensors_information, sensors_informationView, "sensors_information.json")}
  end

  def render("show.json", %{sensors_information: sensors_information}) do
    %{data: render_one(sensors_information, sensors_informationView, "sensors_information.json")}
  end

  def render("sensors_information.json", %{sensors_information: sensors_information}) do
    %{id: sensors_information.id,
      A1: sensors_information.A1,
      A2: sensors_information.A2,
      A3: sensors_information.A3,
      freq1: sensors_information.freq1,
      freq2: sensors_information.freq2,
      freq3: sensors_information.freq3,
      Irms: sensors_information.Irms,
      Vrms: sensors_information.Vrms}
  end
end
