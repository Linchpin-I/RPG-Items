defmodule RpgItem.Item do
  use RpgItem.Web, :model

  schema "items" do
    field :index, :integer
    field :name, :string
    field :type, :string
    field :is_magical, :boolean, default: false
    field :system, :string
    field :cost, :integer
    field :coin, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:index, :name, :type, :is_magical, :system, :cost, :coin])
    |> validate_required([:index, :name, :type, :is_magical, :system, :cost, :coin])
  end
end
