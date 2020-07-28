function MovingObject(options) {
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
  this.game = options.game;
}

MovingObject.prototype.draw = function(ctx) {
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    true
  );

  ctx.fill();
}

MovingObject.prototype.move = function() {
  this.pos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];
  this.pos = this.game.wrap(this.pos);
}
// Dist([x_1, y_1], [x_2, y_2]) = sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)
MovingObject.prototype.distanceBetween = function(object) {
  return Math.sqrt((this.pos[0] - object.pos[0]) ** 2 + (this.pos[1] - object.pos[1]) ** 2)
}

MovingObject.prototype.isCollidedWith = function(otherObject) {
  return this.distanceBetween(otherObject) < (this.radius + otherObject.radius);
}

MovingObject.prototype.collideWith = function(otherObject) {
  this.game.remove(otherObject);
  this.game.remove(this);
}

module.exports = MovingObject;
