defmodule Shotodo.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :uid, :string
      add :phone_number, :string
      add :email, :string
      add :bio, :text
      add :image_file_path, :string
      add :sign_in_mathod, :string
      add :account_id, references(:accounts, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:users, [:account_id])
  end
end
