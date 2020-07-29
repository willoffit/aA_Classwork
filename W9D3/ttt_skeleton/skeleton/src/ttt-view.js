class View {
  constructor(game, $el) { 
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    let that = this;
    $(".tttEl").click(function (e) {
      // console.log(this.id.split("").map((x) => parseInt(x)));
      that.game.playMove(this.id.split("").map((x) => parseInt(x)));
      that.makeMove($(this));
    });
  }

  makeMove($square) {
    if (this.game.currentPlayer === "x") {
      $square.css("background-color", "black");
    } else {
      $square.css("background-color", "white");
    }
    if (this.game.winner()) {
      alert("You won!");
    }
  }

  setupBoard() {
    const newEl = $('<ul></ul>');
    newEl.css('list-style-type', 'none');

    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let liEl = $(`<li id=${i}${j} class="tttEl"></li>`);
        newEl.append(liEl);
      }
    }

    this.$el.append(newEl);
  }
}

module.exports = View;

// FAILED JQUERY STUFF
  // liEl.css({
  //   'display':'block',
  //   'width': '100px',
  //   'height': '100px',
  //   'background-color': 'gray',
  //   'border': '1px solid black'
  // });
  // if($(".tttEl:hover")) {
  //   $(".tttEl").css("background-color", "yellow");
  // }
  // $('.tttEl').hover(function () {
  //   $(this).css("background-color", "yellow")
  // });
  // $('li').mouseover() ({
  //   'background-color': 'yellow'
  // });
  // $(".tttEl").each(function (idx) {
  //   $(this).hover(function () {
  //     $(this).css("background-color", "yellow"),
  //     console.log("Entered list ele!")
  //   }, function () {
  //     $(this).css("background-color", "gray")
  //   });
  // });
  // newEl.css("display", "flex");
  // newEl.css("width", "306px");
  // newEl.css("flex-wrap", "wrap");