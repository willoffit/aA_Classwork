class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupTowers();
  }

  setupTowers() {
    for (let i = 0; i < 3; i++) {
      let pile = $('<ul></ul>');
      if (i === 0) {
        let disc1 = '<li>3</li>';
        let disc2 = '<li>2</li>';
        let disc3 = '<li>1</li>';
        pile.append(disc1, disc2, disc3);
      } 
      this.$el.append(pile);
    }
  }

  render() {
      
  }
}

module.exports = View;
