const FollowToggle = require("./follow_toggle.js");

const readyCallback = () => {
  $('button.follow-toggle').each((_, element) => {
    new FollowToggle($(element));
  });
};

$(readyCallback); 
