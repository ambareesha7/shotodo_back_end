defmodule ShotodoWeb.UserControllerTest do
  use ShotodoWeb.ConnCase

  import Shotodo.UsersFixtures

  alias Shotodo.Users.User

  @create_attrs %{
    bio: "some bio",
    email: "some email",
    image_file_path: "some image_file_path",
    name: "some name",
    phone_number: "some phone_number",
    sign_in_mathod: "some sign_in_mathod",
    uid: "some uid"
  }
  @update_attrs %{
    bio: "some updated bio",
    email: "some updated email",
    image_file_path: "some updated image_file_path",
    name: "some updated name",
    phone_number: "some updated phone_number",
    sign_in_mathod: "some updated sign_in_mathod",
    uid: "some updated uid"
  }
  @invalid_attrs %{bio: nil, email: nil, image_file_path: nil, name: nil, phone_number: nil, sign_in_mathod: nil, uid: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, ~p"/api/users")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/users", user: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/users/#{id}")

      assert %{
               "id" => ^id,
               "bio" => "some bio",
               "email" => "some email",
               "image_file_path" => "some image_file_path",
               "name" => "some name",
               "phone_number" => "some phone_number",
               "sign_in_mathod" => "some sign_in_mathod",
               "uid" => "some uid"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/users", user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user" do
    setup [:create_user]

    test "renders user when data is valid", %{conn: conn, user: %User{id: id} = user} do
      conn = put(conn, ~p"/api/users/#{user}", user: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/users/#{id}")

      assert %{
               "id" => ^id,
               "bio" => "some updated bio",
               "email" => "some updated email",
               "image_file_path" => "some updated image_file_path",
               "name" => "some updated name",
               "phone_number" => "some updated phone_number",
               "sign_in_mathod" => "some updated sign_in_mathod",
               "uid" => "some updated uid"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put(conn, ~p"/api/users/#{user}", user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, ~p"/api/users/#{user}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/users/#{user}")
      end
    end
  end

  defp create_user(_) do
    user = user_fixture()
    %{user: user}
  end
end
