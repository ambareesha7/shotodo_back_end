defmodule Shotodo.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Shotodo.Accounts.Account

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field(:bio, :string)
    field(:email, :string)
    field(:image_file_path, :string)
    field(:name, :string)
    field(:phone_number, :string)
    field(:sign_in_mathod, :string)
    field(:uid, :string)
    belongs_to(:account, Account)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :uid, :phone_number, :email, :bio, :image_file_path, :sign_in_mathod])
    |> validate_required([
      :name,
      :uid,
      :phone_number,
      :email,
      :bio,
      :image_file_path,
      :sign_in_mathod
    ])
  end
end
