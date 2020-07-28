const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js");
window.MovingObject = MovingObject;
window.Asteroid = Asteroid;



window.addEventListener("DOMContentLoaded", (event) => {
  let c = document.getElementById("game-canvas");
  let ctx = c.getContext("2d");
  console.log("DOM Loaded");

  // let asteroid = new Asteroid({pos: [1, 1]});
  // asteroid.draw(ctx);
  // let game = new Game(300);
  // game.draw(ctx);
  // game.moveObjects;
  let view = new GameView(ctx);
  view.start();
});