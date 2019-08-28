class ApplicationController < ActionController::API
    # For demonstration purposes, I'm placing my secret_key here because I know that I am just using dummy data
    # If you are ever going to be using real data (even if you never deploy your application) DO NOT PUSH THIS CODE UP TO GITHUB!!!

    def secret_key
        'sh...super_secret!'
    end

    def encode(payload)
        JWT.encode(payload, secret_key, 'HS256')
    end

    def decode(token)
        JWT.decode(token, secret_key, true, { algorithm: 'HS256'})[0]
    end
end
