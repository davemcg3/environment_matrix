import React from "react"
import PropTypes from "prop-types"

import './Matrix.css'
import Nav from "./Nav"
import Landing from "./Landing";
import Login from "./login/Login";
import Register from "./register/Register";
import Api from "./api/Api";
import User from "./models/User"

class Matrix extends React.Component {
    constructor (props) {
        super(props);
        this.state = {
            available_content: [
                <Landing />,
                <Login />,
                <Register storeToken={this.store_token.bind(this)} />,
            ],
            active_content: 0,
            user: {},
        }
    }

    componentDidMount() {
        let api_key = localStorage.getItem('api_key')
        if(api_key){
            let api = new Api(document.head.querySelector("[name~='csrf-token'][content]").content)
            api.get_user(null, this.process_api_response)
        }
    }

    dig(path, object){
        return path.reduce((xs, x) => (xs && xs[x]) ? xs[x] : null, object)
    }

    process_api_response({ resultStatus, result }){
        let user = new User(result)
        if (user.id > 0){
            this.setState({user: user})
        }
    }

    store_token(user) {
        console.log('storing token')
        this.setState({user: user, active_content: 0})
        localStorage.setItem('api_key', this.dig(['api_key'], user))
    }

    router (route=''){
    console.log('route: ', route)
    switch (route.toLowerCase()) {
        case "login":
          this.setState({active_content: 1});
        break;
        case "logout":
            localStorage.removeItem('api_key')
            this.setState({active_content: 0, user: new User({})});
        break;
      case "register":
          this.setState({active_content: 2});
        break;
      default:
          this.setState({active_content: 0});
    }
    }

    render () {
    return (
      <React.Fragment>
        <Nav router={this.router.bind(this)} api_key={this.dig(['api_key'], this.state.user)} />
        <div className="content">
            {this.state.available_content[this.state.active_content]}
        </div>
      </React.Fragment>
    );
    }
}

export default Matrix
