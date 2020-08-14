import React from 'react';
import { Link } from 'react-router-dom';

class Greeting extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    if (this.props.currentUser) {
      return (
        <div>
          <span>Welcome, {this.props.currentUser.username}</span>
          <button onClick={this.props.logout}>Log Out</button>
          <h1>Bench BnB</h1>
        </div>
      )
    } else {
        return (
          <div> 
            <Link to="/signup">Sign Up    </Link>
            <Link to="/login">Log In</Link>
            <h1>Bench BnB</h1>
          </div>
        )
    } 
  }
}

export default Greeting;