import React from 'react';
import ReactDOM from 'react-dom';
import { fetchAllPokemon } from './util/api_util'
import { fetchOnePokemon } from './util/api_util';
import { requestOnePokemon } from './actions/pokemon_actions';
import  configureStore from './store/store'
import selectAllPokemon from './reducers/selectors';
import Root from './components/root';
import { HashRouter, Route } from "react-router-dom";

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();
  ReactDOM.render(<Root store={store} />, root);
  window.fetchOnePokemon = fetchOnePokemon;
  window.dispatch = store.dispatch;
  window.getStore = store.getStore;
  window.requestOnePokemon = requestOnePokemon;
});