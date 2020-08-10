import ReactDom from "react-dom";
import React from 'react';
import Root from './root.jsx';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root")
  ReactDom.render(<Root />, root);
} );