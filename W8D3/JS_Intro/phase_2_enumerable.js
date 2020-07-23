Array.prototype.myEach = function(callback) {
  for (var i = 0; i < this.length; i++) {
    callback(this[i]);
  }
}

function addOne(ele) {
  return ele + 1;
} 

Array.prototype.myMap = function(callback) {
  mapped = [];

  for (var i = 0; i < this.length; i++) {
    mapped.push(callback(this[i]));
  }

  return mapped;
}

Array.prototype.myReduce = function(callback, initialValue) {
  let newArray = this;
  let acc;
  
  if (initialValue === undefined) {
    acc = this[0];
    newArray = this.slice(1, this.length);
  } else {
    acc = initialValue;
  } 

  newArray.myEach(function(el) {
    acc = callback(acc, el);
  });

  return acc;
}

function addEls(acc, ele) {
  return acc + ele;
} 