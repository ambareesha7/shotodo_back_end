defmodule Shotodo.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Shotodo.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        bio: "some bio",
        email: "some email",
        image_file_path: "some image_file_path",
        name: "some name",
        phone_number: "some phone_number",
        sign_in_mathod: "some sign_in_mathod",
        uid: "some uid"
      })
      |> Shotodo.Users.create_user()

    user
  end
end
