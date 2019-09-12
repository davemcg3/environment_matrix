export default class User {
    constructor({
                    id=0,
                    name='',
                    email='',
                    role='reader',
                    api_key='',
                    created_at='',
                    updated_at='',
                    url=''
    }={}){
        this.id = id;
        this.name = name;
        this.email = email;
        this.role = role;
        this.api_key = api_key;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.url = url;
    }
}
