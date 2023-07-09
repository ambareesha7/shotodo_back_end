defmodule ShotodoWeb.UserJSON do
  alias Shotodo.Users.User

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    %{data: for(user <- users, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      uid: user.uid,
      phone_number: user.phone_number,
      email: user.email,
      bio: user.bio,
      image_file_path: user.image_file_path,
      sign_in_mathod: user.sign_in_mathod
    }
  end
end
