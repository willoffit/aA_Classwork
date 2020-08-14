import React from 'react';
import { Link } from "react-router-dom";


const PokemonIndexItem = ({poke}) => {
  return(
    <li>
      <Link to={`/pokemon/${poke.id}`}>{poke.name}</Link>
      <img src={poke.image_url} />
    </li>
  )
}

export default PokemonIndexItem;