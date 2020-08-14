export const fetchAllPokemon = () => (
  $.ajax({
    method: "GET",
    url: "api/pokemon"
  })
)

export const fetchOnePokemon = (pokemonId) => (
  $.ajax({
    method: "GET",
    url: `api/pokemon/${pokemonId}`
  })
)