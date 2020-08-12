import { connect } from 'react-redux';
import { requestOnePokemon } from '../../actions/pokemon_actions';
import selectAllPokemon from '../../reducers/selectors';
import PokemonDetail from './pokemon_detail'

const mapStateToProps = state => ({
  poke: selectAllPokemon(state),
  items: state.items
});

const mapDispatchToProps = dispatch => ({
  requestOnePokemon: (id) => dispatch(requestOnePokemon(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);