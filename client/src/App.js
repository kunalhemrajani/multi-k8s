import React, { Component } from 'react';
import './App.css';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';
import OtherPage from './OtherPage';
import Fib from './Fib';

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
        <h1>Fib Calc V2 Kubernetes</h1>
          <header className="App-header">
            <Link to="/">Home</Link>
            <Link to="/otherpage">Other Pages</Link>
          </header>
          <div>
            <Route exact path="/" component={Fib} />
            <Route path="otherpage" component={OtherPage} />
          </div>
        </div>
      </Router>
    );
  }
}

export default App;
