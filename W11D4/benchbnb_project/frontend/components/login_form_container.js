import { login } from '../actions/session_actions';
import { connect } from 'react-redux';
import SessionForm from './session_form';
import { Link } from 'react-router-dom';
import React from 'react';

const mapStateToProps = (state, ownProps) => ({
  errors: state.errors,
  formType: 'login',
  navLink: <Link to='/signup'>Sign Up</Link>
})

const mapDispatchToProps = (dispatch, ownProps) => ({
  processForm: (user) => dispatch(login(user))
})

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);