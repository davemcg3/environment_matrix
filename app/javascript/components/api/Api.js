export default class Api {
    constructor (csrf_token) {
        this.csrf_token = csrf_token
    }

    register_user = (params, callback) => {
        let resultStatus, result;
        fetch(
            "/users.json",
            {
                    method: 'POST',
                body: JSON.stringify(params),
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-Token': this.csrf_token,
                }
            }
        )
        .then(res => res.json())
        .then(response => {resultStatus = 'success'; result = response})
        .catch(error => { resultStatus = error; result = {} })
        .finally(() => {
            callback({ resultStatus, result })
        });
    }

    get_user = (params, callback) => {
        let resultStatus, result;
        fetch(
            "/users.json",
            {
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-Token': this.csrf_token,
                }
            }
        )
        .then(res => res.json())
        .then(response => {resultStatus = 'success'; result = response})
        .catch(error => { resultStatus = error; result = {} })
        .finally(() => {
            callback( { resultStatus, result } )
        });
    }
}
