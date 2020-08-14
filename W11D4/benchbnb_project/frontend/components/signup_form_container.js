import { signup } from '../actions/session_actions';
import { connect } from 'react-redux';
import SessionForm from './session_form';
import { Link } from 'react-router-dom';
import React from 'react';

const mapStateToProps = (state, ownProps) => ({
  errors: state.errors,
  formType: 'signup',
  navLink: <Link to='/login'>Log In</Link>
})

const mapDispatchToProps = (dispatch, ownProps) => ({
  processForm: (user) => dispatch(signup(user))
})

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);