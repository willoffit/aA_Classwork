const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");


function Asteroid(options){
  this.COLOR = "brown";
  this.RADIUS = 5;
  MovingObject.call(this, {
    color: "brown",
    radius: 5,
    vel: Util.randomVec(1),
    pos: options.pos,
    game: options.game
  });
};


Util.inherits(Asteroid, MovingObject);
module.exports = Asteroid;