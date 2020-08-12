import { RECEIVE_ALL_POKEMON, RECEIVE_ONE_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer = (state = {}, action) => {
    Object.freeze(state);
    switch (action.type) {
      case RECEIVE_ALL_POKEMON:
        return Object.assign({}, state, action.pokemon);
      case RECEIVE_ONE_POKEMON:
        poke = action.payload.pokemon;

        return Object.assign({}, state, { [poke.id]: poke });
      default:
        return state;
    }
    
}

export default pokemonReducer;