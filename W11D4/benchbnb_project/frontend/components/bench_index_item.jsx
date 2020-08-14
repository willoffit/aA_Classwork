import React from 'react';

const BenchIndexItem = (props) => (
  <li>
    <span>{props.bench.description}</span>
    <span>{props.bench.lat}</span>
    <span>{props.bench.lng}</span>
  </li>
)

export default BenchIndexItem;
