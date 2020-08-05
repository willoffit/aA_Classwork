import React from 'react';

export default class Tabs extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      index: 0,
    };
    this.updateIndex = this.updateIndex.bind(this);
  }

  updateIndex(index) {
    this.setState({ index });
  }

  render() {
    const currContent = this.props.tabsContent[this.state.index].content;

    return (
      <div className="tabs">
        <Header
          tabsContent={this.props.tabsContent}
          updateIndex={this.updateIndex}
        />
        <p>{currContent}</p>
      </div>
    );
  }
}

const Header = ({ tabsContent, updateIndex }) => {
  return (
    <div className="tabs-header">
      {tabsContent.map((tab, index) => {
        return (
          <span key={tab.id} onClick={() => updateIndex(index)}>
            {tab.title}
          </span>
        );
      })}
    </div>
  );
};
