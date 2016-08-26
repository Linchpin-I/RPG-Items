defmodule RpgItem.ItemView do
  use RpgItem.Web, :view

  def render("index.json", %{items: items}) do
    %{data: render_many(items, RpgItem.ItemView, "item.json")}
  end

  def render("show.json", %{item: item}) do
    %{data: render_one(item, RpgItem.ItemView, "item.json")}
  end

  def render("item.json", %{item: item}) do
    %{id: item.id,
      index: item.index,
      name: item.name,
      type: item.type,
      is_magical: item.is_magical,
      system: item.system,
      cost: item.cost,
      coin: item.coin}
  end
end
