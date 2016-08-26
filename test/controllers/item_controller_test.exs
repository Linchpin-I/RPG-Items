defmodule RpgItem.ItemControllerTest do
  use RpgItem.ConnCase

  alias RpgItem.Item
  @valid_attrs %{coin: "some content", cost: 42, index: 42, is_magical: true, name: "some content", system: "some content", type: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, item_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    item = Repo.insert! %Item{}
    conn = get conn, item_path(conn, :show, item)
    assert json_response(conn, 200)["data"] == %{"id" => item.id,
      "index" => item.index,
      "name" => item.name,
      "type" => item.type,
      "is_magical" => item.is_magical,
      "system" => item.system,
      "cost" => item.cost,
      "coin" => item.coin}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, item_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, item_path(conn, :create), item: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Item, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, item_path(conn, :create), item: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    item = Repo.insert! %Item{}
    conn = put conn, item_path(conn, :update, item), item: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Item, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    item = Repo.insert! %Item{}
    conn = put conn, item_path(conn, :update, item), item: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    item = Repo.insert! %Item{}
    conn = delete conn, item_path(conn, :delete, item)
    assert response(conn, 204)
    refute Repo.get(Item, item.id)
  end
end
