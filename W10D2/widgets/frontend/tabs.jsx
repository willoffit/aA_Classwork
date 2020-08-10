import React from 'react';

class Header extends React.Component {
  render() {
    const selected = this.props.selected;
    const headers = this.props.array.map((obj, index) => {
      const title = obj.title;
      const klass = index === selected ? "active" : "";

      return (
        <li key={index} className={klass} onClick={() => this.props.onTabChosen(index)}>
          {title}
        </li>
      );
    });

    return (
      <ul className="tab-header">
          {headers}
      </ul>
    );
  }
}

export default class Tabs extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      index: 0,
    }

    this.selectTab = this.selectTab.bind(this);
  }

  selectTab(num) {
    this.setState({index: num})
  }

  render() {
    const pane = this.props.objects[this.state.index];

    return(
      <div className="tab-box">
        <h1>Tabs</h1>
        <div className="tabs">
          <Header onTabChosen={this.selectTab} array={this.props.objects} selected={this.state.index} />
        </div>
        <div className="tab-content">
          <article>{pane.content}</article>
        </div>
      </div>
    )
  }
}