import React from 'react';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  header() {
    if (this.props.formType === 'login') {
      return (
        <div>
          <Link to="/signup">Sign Up</Link>
          <h1>Log In</h1>
        </div>
      )
    } else if (this.props.formType === 'signup') {
      return (
        <div>
          <Link to="/login">Log In</Link>
          <h1>Sign Up</h1>
        </div>
      )
    }
  }

  errors() {
    return (
      <ul>
        {this.props.errors.map((error, idx) => 
          <li key={idx}>
            {error}
          </li>)}
      </ul>
    )
  }

  render() {
    return(
      <div>
        {this.header()}
        {this.errors()}
        <form onSubmit={this.handleSubmit}>
          <button>Submit</button>
        </form>
      </div>
    )
  }
}          
export default SessionForm;
