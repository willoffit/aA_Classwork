const selectAllPokemon = (state) => (
  Object.values(state.entities.pokemon)
)

export default selectAllPokemon;