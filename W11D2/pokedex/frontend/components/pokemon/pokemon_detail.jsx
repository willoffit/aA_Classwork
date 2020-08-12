import React from 'react';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestOnePokemon(this.props.match.params.pokemonId);
  }

  render() {
    return(
      <div>
        <h3>{this.props.poke.name}</h3>
        <ul>
          <li>
            Attack: {this.props.poke.attack}
          </li>
          <li>
            Defense: {this.props.poke.defense}
          </li>
          <li>
            Poke Type: {this.props.poke.poke_type}
          </li>
          <li>
            Moves: {this.props.poke.moves}
          </li>
        </ul>
        <ul>
        </ul>
      </div>
    )
  }
}

export default PokemonDetail;