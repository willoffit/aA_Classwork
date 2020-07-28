const Asteroid = require("./asteroid.js");

function Game(num_asteroids) {
  this.DIM_X = 500;
  this.DIM_Y = 500;
  this.NUM_ASTEROIDS = num_asteroids;
  this.addAsteroids();
};

Game.prototype.addAsteroids = function() {
  let asteroids = [];
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    asteroids.push(new Asteroid({ pos: this.randomPosition(), game: this }));
  }
  this.asteroids = asteroids;
};

Game.prototype.randomPosition = function() {
  let x = Math.random() * this.DIM_X;
  let y = Math.random() * this.DIM_Y;
  return [x, y];
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, 500, 500);
  this.asteroids.forEach((asteroid) => {
    asteroid.draw(ctx);
  });
}

Game.prototype.moveObjects = function() {
  this.asteroids.forEach((asteroid) => {
    asteroid.move();
  });
}

Game.prototype.wrap = function(pos) {
  let x = pos[0];
  let y = pos[1];
  if (x > this.DIM_X) x -= this.DIM_X;
  if (y > this.DIM_Y) y -= this.DIM_Y;
  if (x < 0) x += this.DIM_X;
  if (y < 0) y += this.DIM_Y;
  return [x, y];
}

Game.prototype.checkCollisions = function() {
  for (let i = 0; i < this.asteroids.length - 1; i++) {
    for (let j = i + 1; j < this.asteroids.length; j++) {
      if (this.asteroids[i].isCollidedWith(this.asteroids[j])) {
        this.asteroids[i].collideWith(this.asteroids[j]);
      }
    }
  }
}

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
}

Game.prototype.remove = function(asteroid) {
  this.asteroids.splice(this.asteroids.indexOf(asteroid), 1);
}

module.exports = Game;