import React from 'react';
import Clock from './clock';
import Tabs from './tabs';

const objects = [{
  title: "one",
  content: "I am the first",
}, {
  title: "two",
  content: "Second pane here",
  }, {
  title: "three",
  content: "Third pane here",
}];

export default function Root() {
  return(
    <div>
      <Clock />
      <Tabs objects={objects}/>
    </div>
  );
}