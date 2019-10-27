defmodule SceniaWeb.UserController do
  use SceniaWeb, :controller

  alias Scenia.Sensor
  alias Scenia.Sensor.User

  action_fallback SceniaWeb.FallbackController

  def index(conn, _params) do
    users = Sensor.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    case Sensor.get_username(Map.get(user_params, "username")) do
      nil -> create_user(conn, user_params)
      _ -> conn |> put_status(400) |> json(%{error: "User already exists"})
    end


  end

  defp create_user(conn, user_params) do
    with {:ok, %User{} = user} <- Sensor.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Sensor.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Sensor.get_user!(id)

    with {:ok, %User{} = user} <- Sensor.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def login(conn, %{"username" => username, "password" => password}) do
    user = Sensor.get_username(username)
    IO.inspect user
    case user do
      %User{} -> validate_password(conn, password, user)
      nil -> conn |> put_status(400) |> json(%{auth: false, reason: "Wrong parameters"})
    end
  end

  defp validate_password(conn, password, user) do
    case user.password == password do
      true -> conn |> put_status(201) |> json(%{auth: true})
      false -> conn |> put_status(400) |> json(%{auth: false, reason: "Wrong password"})
    end
  end
end
