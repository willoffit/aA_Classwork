import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import PokemonDetailContainer from "./pokemon_detail_container";
import {Route} from 'react-router-dom';

export default class PokemonIndex extends React.Component {
  constructor(props) {
    super(props)
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    return (
      <div>
        <Route exact path="/pokemon/:pokemonId" component={PokemonDetailContainer} />
        <section className="pokedex">
          <ul>
            {this.props.pokemon.map((poke) => <PokemonIndexItem poke={poke} key={poke.id} />)}
          </ul>
        </section>
      </div>
    )
  }
}