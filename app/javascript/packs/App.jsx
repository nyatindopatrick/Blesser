import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Home from './components/Home/Home';
import Login from './components/Auth/Login';

export default function App() {
  return (
    <Router>
      <Switch>
        <Route path='/' component={Home} exact />
        <Route exact path='/login' component={Login} />
      </Switch>
    </Router>
  );
}
