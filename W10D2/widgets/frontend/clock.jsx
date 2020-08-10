import React from 'react';

export default class Clock extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      time: new Date()
    }

    this.tick = this.tick.bind(this);
  }

  componentDidMount() {
    this.handle = setInterval(this.tick, 1000);
  }

  componentWillUnMount() {
    clearInterval(handle);
  }

  tick() {
    this.setState({ time: new Date() });
  }

  render() {
    let time = this.state.time;
    let hours = `${time.getHours()}`;
    let minutes = time.getMinutes() >= 10 ? `${time.getMinutes()}` : `0${time.getMinutes()}`;
    let seconds = time.getSeconds() >= 10 ? `${time.getSeconds()}` : `0${time.getSeconds()}`;
    let day = time.getDay();
    switch (day) {
      case 0:
        day = `Sun`;
        break;
      case 1:
        day = `Mon`;
        break;
      case 2:
        day = `Tues`;
        break;
      case 3:
        day = `Wed`;
        break;
      case 4:
        day = `Thurs`;
        break;
      case 5:
        day = `Fri`;
        break;
      case 6:
        day = `Sat`;
    }
    let numberDay = time.getDate() >= 10 ? `${time.getDate()}` : `0${time.getDate()}`;
    let month = time.getMonth();
    switch(month) {
      case 0:
        month = `Jan`;
        break;
      case 1:
        month = `Feb`;
        break;
      case 2:
        month = `Mar`;
        break;
      case 3:
        month = `April`;
        break;
      case 4:
        month = `May`;
        break;
      case 5:
        month = `June`;
        break;
      case 6:
        month = `Jul`;
        break;
      case 7:
        month = `Aug`;
        break;
      case 8:
        month = `Sep`;
        break;
      case 9:
        month = `Oct`;
        break;
      case 10:
        month = `Nov`;
        break;
      case 11:
        month = `Dex`;
    }
    let year = `${time.getFullYear()}`;
    
    return(
      <div className="clock">
        <h1 className="clock-title">Clock</h1>
        <div className="time-and-date">
          <p className="time">
            <label>Time:</label>
            <span className="time">{`${hours}:${minutes}:${seconds} PDT`}</span>
          </p>
          <p className="date">
            <label>Date:</label>
            <span className="date">{`${day} ${month} ${numberDay} ${year}`}</span>
          </p>
        </div>
      </div>
    )
  }
}