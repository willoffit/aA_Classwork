import React from 'react';
import ReactDOM from 'react-dom';
import Clock from './components/clock';
import Tabs from './components/tabs';

const tabsContent = [
  {
    id: "1",
    title: 'one',
    content: 'this is the first tab',
  },
  {
    id: "2",
    title: 'two',
    content: 'this is the second tab',
  },
  {
    id: "3",
    title: 'three',
    content: 'this is the third tab',
  },
];


class Root extends React.Component {
  render() {
    return (
      <div>
        <Clock />
        <Tabs tabsContent={tabsContent} />
      </div>
    );
  }
}

ReactDOM.render(<Root />, document.getElementById('root'));
