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

  alias Scenia.Sensor.sensors_information

  @doc """
  Returns the list of sensors_information.

  ## Examples

      iex> list_sensors_information()
      [%sensors_information{}, ...]

  """
  def list_sensors_information do
    Repo.all(sensors_information)
  end

  @doc """
  Gets a single sensors_information.

  Raises `Ecto.NoResultsError` if the sensors_information does not exist.

  ## Examples

      iex> get_sensors_information!(123)
      %sensors_information{}

      iex> get_sensors_information!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sensors_information!(id), do: Repo.get!(sensors_information, id)

  @doc """
  Creates a sensors_information.

  ## Examples

      iex> create_sensors_information(%{field: value})
      {:ok, %sensors_information{}}

      iex> create_sensors_information(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sensors_information(attrs \\ %{}) do
    %sensors_information{}
    |> sensors_information.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sensors_information.

  ## Examples

      iex> update_sensors_information(sensors_information, %{field: new_value})
      {:ok, %sensors_information{}}

      iex> update_sensors_information(sensors_information, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sensors_information(%sensors_information{} = sensors_information, attrs) do
    sensors_information
    |> sensors_information.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sensors_information.

  ## Examples

      iex> delete_sensors_information(sensors_information)
      {:ok, %sensors_information{}}

      iex> delete_sensors_information(sensors_information)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sensors_information(%sensors_information{} = sensors_information) do
    Repo.delete(sensors_information)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sensors_information changes.

  ## Examples

      iex> change_sensors_information(sensors_information)
      %Ecto.Changeset{source: %sensors_information{}}

  """
  def change_sensors_information(%sensors_information{} = sensors_information) do
    sensors_information.changeset(sensors_information, %{})
  end
end
