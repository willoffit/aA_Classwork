import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      time: new Date(),
    };
    this.tick = this.tick.bind(this);
    this.ticker;
  }

  tick() {
    const time = new Date();
    this.setState({ time });
  }

  componentDidMount() {
    this.ticker = setInterval(this.tick, 1000);
  }

  componentWillUnmount() {
    clearInterval(this.ticker);
  }

  render() {
    return (
      <>
        <h1>Clock</h1>
        <div className="clock">
          <label>Date:</label>
          <time>{this.state.time.toDateString()}</time>
          <label>Time:</label>
          <time> {this.state.time.toTimeString()}</time>
        </div>
      </>
    );
  }
}

export default Clock;
