import React from "react"
import PropTypes from "prop-types"
import "./Register.css"
import Api from "../api/Api"
import User from "../models/User"

class Register extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      flash: '',
    }
  }

  submit(event){
    event.preventDefault();
    let inputs = Array.from(event.target.children).filter(element => { return element.nodeName.toLowerCase() == "input"})
    let params = {}
    inputs.forEach(input => {params[input.name] = input.value})

    let api = new Api(document.head.querySelector("[name~='csrf-token'][content]").content)
    api.register_user(params, this.process_api_response.bind(this))
  }

  process_api_response({ resultStatus, result }){
    let user = new User(result)
    if (user.id > 0){
      this.props.storeToken(user)
    } else {
      // display error
      this.setState({flash: resultStatus})
    }
  }

  render () {
    return (
      <React.Fragment>
        <h2>Register</h2>
        <form onSubmit={this.submit.bind(this)}>
          <div className={ this.state.flash=='' ? 'flash initially-hidden' : 'flash'}>
            {this.state.flash}
          </div>

          <label>Name</label>
          <input type="text" name="name" />

          <label>Email</label>
          <input type="email" name="email" />

          <button type="submit">Register</button>
        </form>
      </React.Fragment>
    );
  }
}

export default Register
