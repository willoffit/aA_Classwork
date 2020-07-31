const APIUtil = require("./api_util");

class FollowToggle {
  constructor($el) {
    this.$el = $el;
    this.userId = this.$el.data("id");
    this.followState = this.$el.data("initial-follow-state");
    this.render();
    this.$el.on('click', e => {
      this.handleClick(e);
      
    });
  };

  render() {
    // freezing button
    if (this.followState === 'following' || this.followState === 'unfollowing') {
      this.$el.prop('disabled', "true");
    }
    //     console.log(this.$el);
    // } else {
    //     if (this.$el.prop('disabled') === 'true') {
    //         this.$el.prop('disabled', 'false');
    //     };

    // rendering button
    if (this.followState === 'unfollowed') {
        this.$el.text('Follow!');
    } else {
        this.$el.text('Unfollow!');
    }
  };

  handleClick(e) {
    e.preventDefault();
    if (this.followState === 'unfollowed') {
        APIUtil.followUser(this.userId)
        .then(res => {
            this.followState = 'following';
            this.render();
        })
        .then(res => {
            this.followState = 'followed';
            this.render();
        })
    } else {
        APIUtil.unfollowUser(this.userId)
        .then(res => {
            this.followState = 'unfollowing';
            this.render();
        })
        .then(res => {
            this.followState = 'unfollowed';
            this.render();
        })
    }
  };
};

module.exports = FollowToggle;