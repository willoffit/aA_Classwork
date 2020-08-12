import React from 'react';
import { Link } from "react-router-dom";


const PokemonIndexItem = ({poke}) => {
  return(
    <li>
      <Link to="/pokemon/:pokemonId">{poke.name}</Link>
      <img src={poke.image_url} />
    </li>
  )
}

export default PokemonIndexItem;