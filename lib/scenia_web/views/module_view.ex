defmodule SceniaWeb.ModuleView do
  use SceniaWeb, :view
  alias SceniaWeb.ModuleView

  def render("index.json", %{module: module}) do
    %{data: render_many(module, ModuleView, "module.json")}
  end

  def render("show.json", %{module: module}) do
    %{data: render_one(module, ModuleView, "module.json")}
  end

  def render("module.json", %{module: module}) do
    %{id: module.id,
      serial: module.serial,
      username: module.username}
  end
end
