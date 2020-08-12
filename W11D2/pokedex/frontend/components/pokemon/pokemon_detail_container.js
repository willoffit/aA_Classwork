import { connect } from 'react-redux';
import { requestOnePokemon } from '../../actions/pokemon_actions';
import selectAllPokemon from '../../reducers/selectors';
import PokemonIndex from './pokemon_index';
import PokemonDetail from './pokemon_detail'

const mapStateToProps = state => ({
  poke: state.pokemon,
  items: state.items
});

const mapDispatchToProps = dispatch => ({
  requestOnePokemon: (id) => dispatch(requestAllPokemon(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);