Array.prototype.uniq = function() {
  var unique_values = [];

  for (var i = 0; i < this.length; i += 1) {
    if (!(unique_values.includes(this[i]))) {
      unique_values.push(this[i]);
    }
  }

  return unique_values;
}

Array.prototype.twoSum = function() {
  var pairs = [];

  for (var i = 0; i < this.length; i += 1) {
    for (var j = i + 1; j < this.length; j += 1) {
      if (this[i] + this[j] === 0) {
        pairs.push([i, j]);
      }
    }
  }

  return pairs;
}

Array.prototype.transpose = function() {
  var transposed = [];

  for (var i = 0; i < this.length; i += 1) {
    var sub_array = [];

    for (var j = 0; j < this.length; j += 1) {
      sub_array.push(this[j][i]);
    }

    transposed.push(sub_array);
  }

  return transposed;
}

