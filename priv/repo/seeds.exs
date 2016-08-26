# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RpgItem.Repo.insert!(%RpgItem.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias RpgItem.Repo
alias RpgItem.Item

Repo.insert!(%Item{index: 1, name: "Chain Mail", type: "Armor", is_magical: false, system: "4th ed.", cost: 20, coin: "Gold"})
Repo.insert!(%Item{index: 2, name: "+1 Long Sword", type: "Weapon", is_magical: true, system: "Pathfinder", cost: 1000, coin: "Gold"})
Repo.insert!(%Item{index: 3, name: "Flask of Oil", type: "Misc.", is_magical: false, system: "5th ed.", cost: 5, coin: "Silver"})

