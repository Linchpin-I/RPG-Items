defmodule RpgItem.Repo.Migrations.CreateItem do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :index, :integer
      add :name, :string
      add :type, :string
      add :is_magical, :boolean, default: false, null: false
      add :system, :string
      add :cost, :integer
      add :coin, :string

      timestamps()
    end

  end
end
