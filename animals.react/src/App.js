import React, { Component } from 'react';
import {
  BrowserRouter as Router,
  Route,
} from 'react-router-dom'

import BandList from './components/bandList'
import BandAlbums from './components/bandAlbums'
import AnimalsDisplay from './components/AnimalsDisplay'

// define the router, there are only two pages: 
// 1. The band list which is the 'default' page.
// 2. the band page which expects a name of a band and shows details about that band. 
const AppRoute = () => 
  <Router>
    <main>
      <Route exact path="/" component={ AnimalsDisplay }/>
      <Route path="/bands" component={ BandList }/>
      <Route path="/band/:id" component={ BandAlbums }/>
    </main>
  </Router>

class App extends Component {
  render() {
    return (
      <div className="App">
        <AppRoute />
      </div>
    );
  }
}

export default App;
