const DOMNodeCollection = require("./dom_node_collection.js");

window.$l = function(arg) {
  let arrLike, argArray;

  if (arg instanceof String) {
    arrLike = document.querySelectorAll(arg);
    argArray = Array.from(arrLike);
  }

  if (arg instanceof HTMLElement) {
    argArray = Array.from(arg);
  }

  return new DOMNodeCollection(argArray);
}


// $("fwaf")
