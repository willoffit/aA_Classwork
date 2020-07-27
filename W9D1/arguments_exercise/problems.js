// Write a sum function that takes any number of arguments:
// Solve it first using the arguments keyword, then rewrite your solution to use the ...rest operator.

// function sum() {
//   let args = Array.from(arguments);
//   let res = 0;

//   args.forEach((arg) => res += arg)

//   return res;
// }

// function sum(...args) {
//   let res = 0;

//   args.forEach((arg) => res += arg)

//   return res;
// }

// // console.log(sum(1, 2, 3, 4)) // 10
// // console.log(sum(1, 2, 3, 4, 5)) // 15





// Function.prototype.myBind = function (context) {
//   let bindArgs = Array.from(arguments).slice(1);
//   let that = this;

//   return function() { 
//     let callArgs = Array.from(arguments);
//     let allArgs = bindArgs.concat(callArgs);
//     return that.apply(context, allArgs);
//   }
// }



// Function.prototype.myBind = function (context, ...bindArgs) {
//     let that = this;

//     return function (...callArgs) {
//         let allArgs = bindArgs.concat(callArgs);
//         return that.apply(context, allArgs);
//     }
// }



// class Cat {
//   constructor(name) {
//     this.name = name;
//   }

//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }

// class Dog {
//   constructor(name) {
//     this.name = name;
//   }
// }

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// // markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true

function curriedSum(numArgs) {
  let numbers = [];
  let sum = 0;

  return function _curriedSum(number) {
    numbers.push(number);

    if (numbers.length === numArgs) {
      numbers.forEach((num) => sum += num);
      return sum;
    } else {
      return _curriedSum;
    }
  }
}

// const sum = curriedSum(4);
// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); //56

//Function.prototype.apply version

Function.prototype.curry = function (numArgs) { 
    let args = []; 
    let that = this;

    return function _curried(argument) { 
        args.push(argument);

        if (combined.length === numArgs) {
            return that.apply(null, args);
        } else {
            return _curried;
        }
    }
}

Function.prototype.curry2 = function (nArg) {
  const argArray = [];
  const _curriedFn = (arg) => {
    argArray.push(arg);
    if (argArray.length === nArg) {
      // spreading the array into individual arguments
      return this(...argArray);
    } else {
      return _curriedFn;
    }
  };
  return _curriedFn;
};

// ... (the spread operator) version

Function.prototype.curry = function (numArgs) { //4
    let args = []; //3
    let that = this;

    return function _curried(...arguments) { //3
      let combined = args.concat(arguments);

      if (combined.length > numArgs) {
        let args2 = combined.slice(0, numArgs + 1); //[1,4,6,8,5,3]
        return that.apply(null, args2)
      }

      if (combined.length === numArgs) {
          return that.apply(null, args);
      } else {
          return _curried;
      }
    }  
}

const sum = function(){}.curry(4);
console.log(sum(5)(30, 1, 3, 5)(20)(1)); //56