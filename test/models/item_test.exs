defmodule RpgItem.ItemTest do
  use RpgItem.ModelCase

  alias RpgItem.Item

  @valid_attrs %{coin: "some content", cost: 42, index: 42, is_magical: true, name: "some content", system: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Item.changeset(%Item{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Item.changeset(%Item{}, @invalid_attrs)
    refute changeset.valid?
  end
end
