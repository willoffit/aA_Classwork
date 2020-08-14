import React from 'react';
import { Link } from 'react-router-dom';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.update = this.update.bind(this);
  }

  handleSubmit(e) {
    e.preventDefault();
    const user = Object.assign({}, this.state);
    this.props.processForm(user);
  }

  header() {
    return (
      <h1>{this.props.formType}</h1>
    )
  }

  errors() {
    return (
      <ul>
        {this.props.errors.session.map((error, idx) => 
          <li key={idx}>
            {error}
          </li>)}
      </ul>
    )
  }

  update(field) {
    return e => this.setState({
      [field]: e.currentTarget.value
    });
  }

  render() {
    return(
      <div>
        {this.header()}
        {this.errors()}
        <form onSubmit={this.handleSubmit}>
          <label>Username: 
            <input type="text" onChange={this.update("username")} value={this.state.username}></input>
          </label>
          <label>Password:
            <input type="password" onChange={this.update("password")} value={this.state.password}></input>
          </label>
          <button>Submit</button>
        </form>
        <br></br>
        {this.props.navLink}
      </div>
    )
  }
}   
       
export default SessionForm;