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
        <h3>{this.props.poke.poke_type}</h3>
      </div>
    )
  }
}

export default PokemonDetail;