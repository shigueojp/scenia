defmodule Scenia.Sensor do
  @moduledoc """
  The Sensor context.
  """

  import Ecto.Query, warn: false
  alias Scenia.Repo

  alias Scenia.Sensor.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  def get_username(username) do
    User
    |> where([u], u.username == ^username)
    |> Repo.one
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Scenia.Sensor.Module

  @doc """
  Returns the list of module.

  ## Examples

      iex> list_module()
      [%Module{}, ...]

  """
  def list_module do
    Repo.all(Module)
  end

  @doc """
  Gets a single module.

  Raises `Ecto.NoResultsError` if the Module does not exist.

  ## Examples

      iex> get_module!(123)
      %Module{}

      iex> get_module!(456)
      ** (Ecto.NoResultsError)

  """
  def get_module!(id), do: Repo.get!(Module, id)

  @doc """
  Creates a module.

  ## Examples

      iex> create_module(%{field: value})
      {:ok, %Module{}}

      iex> create_module(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_module(attrs \\ %{}) do
    %Module{}
    |> Module.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a module.

  ## Examples

      iex> update_module(module, %{field: new_value})
      {:ok, %Module{}}

      iex> update_module(module, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_module(%Module{} = module, attrs) do
    module
    |> Module.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Module.

  ## Examples

      iex> delete_module(module)
      {:ok, %Module{}}

      iex> delete_module(module)
      {:error, %Ecto.Changeset{}}

  """
  def delete_module(%Module{} = module) do
    Repo.delete(module)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking module changes.

  ## Examples

      iex> change_module(module)
      %Ecto.Changeset{source: %Module{}}

  """
  def change_module(%Module{} = module) do
    Module.changeset(module, %{})
  end

  alias Scenia.Sensor.SensorInformation

  @doc """
  Returns the list of sensor_informations.

  ## Examples

      iex> list_sensor_informations()
      [%SensorInformation{}, ...]

  """
  def list_sensor_informations do
    Repo.all(SensorInformation)
  end

  @doc """
  Gets a single sensor_information.

  Raises `Ecto.NoResultsError` if the Sensor information does not exist.

  ## Examples

      iex> get_sensor_information!(123)
      %SensorInformation{}

      iex> get_sensor_information!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sensor_information!(id), do: Repo.get!(SensorInformation, id)

  @doc """
  Creates a sensor_information.

  ## Examples

      iex> create_sensor_information(%{field: value})
      {:ok, %SensorInformation{}}

      iex> create_sensor_information(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sensor_information(attrs \\ %{}) do
    %SensorInformation{}
    |> SensorInformation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sensor_information.

  ## Examples

      iex> update_sensor_information(sensor_information, %{field: new_value})
      {:ok, %SensorInformation{}}

      iex> update_sensor_information(sensor_information, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sensor_information(%SensorInformation{} = sensor_information, attrs) do
    sensor_information
    |> SensorInformation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a SensorInformation.

  ## Examples

      iex> delete_sensor_information(sensor_information)
      {:ok, %SensorInformation{}}

      iex> delete_sensor_information(sensor_information)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sensor_information(%SensorInformation{} = sensor_information) do
    Repo.delete(sensor_information)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sensor_information changes.

  ## Examples

      iex> change_sensor_information(sensor_information)
      %Ecto.Changeset{source: %SensorInformation{}}

  """
  def change_sensor_information(%SensorInformation{} = sensor_information) do
    SensorInformation.changeset(sensor_information, %{})
  end
end
