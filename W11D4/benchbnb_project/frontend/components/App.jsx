import GreetingContainer from "./Greeting/greeting_container";
import React from 'react';
import { AuthRoute } from "../util/rout_util";
import LogInFormContainer from './login_form_container';
import SignUpFormContainer from './signup_form_container';
import { Route } from 'react-router-dom';

const App = () => (
  <div>
    <header>
      <GreetingContainer />
    </header>
    <AuthRoute path="/login" component={LogInFormContainer} />
    <AuthRoute path="/signup" component={SignUpFormContainer} />
  </div>
);

export default App;