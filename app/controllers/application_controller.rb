class ApplicationController < ActionController::API

    def current_user
        id = decode_token['id']
        User.find_by(id: id)
    end

    def decode_token
        begin
            JWT.decode(token, secret).first
        rescue
            {}
        end
    end

    def token
        request.headers['Authorisation']
    end

    def issue_token(data)
        JWT.encode(data, secret)
    end

    def secret
        'shh'
    end


end
