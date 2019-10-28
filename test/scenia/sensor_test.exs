defmodule Scenia.SensorTest do
  use Scenia.DataCase

  alias Scenia.Sensor

  describe "users" do
    alias Scenia.Sensor.User

    @valid_attrs %{email: "some email", name: "some name", password: "some password", username: "some username"}
    @update_attrs %{email: "some updated email", name: "some updated name", password: "some updated password", username: "some updated username"}
    @invalid_attrs %{email: nil, name: nil, password: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sensor.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Sensor.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Sensor.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Sensor.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
      assert user.password == "some password"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sensor.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Sensor.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.name == "some updated name"
      assert user.password == "some updated password"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Sensor.update_user(user, @invalid_attrs)
      assert user == Sensor.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Sensor.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Sensor.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Sensor.change_user(user)
    end
  end

  describe "module" do
    alias Scenia.Sensor.Module

    @valid_attrs %{serial: "some serial", username: "some username"}
    @update_attrs %{serial: "some updated serial", username: "some updated username"}
    @invalid_attrs %{serial: nil, username: nil}

    def module_fixture(attrs \\ %{}) do
      {:ok, module} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sensor.create_module()

      module
    end

    test "list_module/0 returns all module" do
      module = module_fixture()
      assert Sensor.list_module() == [module]
    end

    test "get_module!/1 returns the module with given id" do
      module = module_fixture()
      assert Sensor.get_module!(module.id) == module
    end

    test "create_module/1 with valid data creates a module" do
      assert {:ok, %Module{} = module} = Sensor.create_module(@valid_attrs)
      assert module.serial == "some serial"
      assert module.username == "some username"
    end

    test "create_module/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sensor.create_module(@invalid_attrs)
    end

    test "update_module/2 with valid data updates the module" do
      module = module_fixture()
      assert {:ok, %Module{} = module} = Sensor.update_module(module, @update_attrs)
      assert module.serial == "some updated serial"
      assert module.username == "some updated username"
    end

    test "update_module/2 with invalid data returns error changeset" do
      module = module_fixture()
      assert {:error, %Ecto.Changeset{}} = Sensor.update_module(module, @invalid_attrs)
      assert module == Sensor.get_module!(module.id)
    end

    test "delete_module/1 deletes the module" do
      module = module_fixture()
      assert {:ok, %Module{}} = Sensor.delete_module(module)
      assert_raise Ecto.NoResultsError, fn -> Sensor.get_module!(module.id) end
    end

    test "change_module/1 returns a module changeset" do
      module = module_fixture()
      assert %Ecto.Changeset{} = Sensor.change_module(module)
    end
  end
end
