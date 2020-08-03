class DOMNodeCollection {
    constructor(nodes) {
      this.nodes = nodes;
    }

    function html(string) {
      if (string) {
        this.nodes.forEach(node => {
          node.innerHTML = string;
        });
      } else {
        return this.nodes[0].innerHTML;
      }
    }
}

module.exports(DOMNodeCollection);
