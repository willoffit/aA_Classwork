json.pokemon do
  json.extract! @pokemon, :name, :attack, :defense, :poke_type, :moves, :item_ids, :image_url
end

json.items do
  @pokemon.items.each do |item|
    json.set! item.id do
      json.extract! item, :id, :name, :pokemon_id, :price, :happiness, :image_url
    end
  end
end