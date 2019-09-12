import React from "react"
import PropTypes from "prop-types"
import './Nav.css'

class Nav extends React.Component {
  click (event){
    this.props.router(event.target.innerText)
  }

  showButtons () {
      if (this.props.api_key !== null){
          return (
              <button onClick={this.click.bind(this)}>Logout</button>
          )
      } else {
          return (
              <React.Fragment>
                  <button onClick={this.click.bind(this)}>Register</button>
                  <button onClick={this.click.bind(this)}>Login</button>
              </React.Fragment>
          )
      }
  }

  render () {
    return (
      <nav>
          {this.showButtons()}
        <h1>Environment Matrix</h1>
      </nav>
    );
  }
}

export default Nav
