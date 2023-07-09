defmodule Shotodo.UsersTest do
  use Shotodo.DataCase

  alias Shotodo.Users

  describe "users" do
    alias Shotodo.Users.User

    import Shotodo.UsersFixtures

    @invalid_attrs %{bio: nil, email: nil, image_file_path: nil, name: nil, phone_number: nil, sign_in_mathod: nil, uid: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{bio: "some bio", email: "some email", image_file_path: "some image_file_path", name: "some name", phone_number: "some phone_number", sign_in_mathod: "some sign_in_mathod", uid: "some uid"}

      assert {:ok, %User{} = user} = Users.create_user(valid_attrs)
      assert user.bio == "some bio"
      assert user.email == "some email"
      assert user.image_file_path == "some image_file_path"
      assert user.name == "some name"
      assert user.phone_number == "some phone_number"
      assert user.sign_in_mathod == "some sign_in_mathod"
      assert user.uid == "some uid"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{bio: "some updated bio", email: "some updated email", image_file_path: "some updated image_file_path", name: "some updated name", phone_number: "some updated phone_number", sign_in_mathod: "some updated sign_in_mathod", uid: "some updated uid"}

      assert {:ok, %User{} = user} = Users.update_user(user, update_attrs)
      assert user.bio == "some updated bio"
      assert user.email == "some updated email"
      assert user.image_file_path == "some updated image_file_path"
      assert user.name == "some updated name"
      assert user.phone_number == "some updated phone_number"
      assert user.sign_in_mathod == "some updated sign_in_mathod"
      assert user.uid == "some updated uid"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end
