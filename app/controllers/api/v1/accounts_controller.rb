module Api
    module V1
        class AccountsController < ApplicationController

            def create
                account = Account.new(create_params)
                if account.save
                    render json: { status: 'SUCCESS', data: account }
                else
                    render json: { status: 'ERROR', data: account.errors}
                end
            end

            def login
                account = Account.find_by(username: login_params[:username])
                if account.authenticate(login_params[:password])
                    render json: { status: 'SUCCESS', account_id: account[:account_id], username: account[:username] } 
                else
                    render json: { status: 'ERROR'}
                end
                
            end


            def create_params
                params.permit(:account_id, :username, :password)
            end

            def login_params
                params.permit(:username, :password)
            end
        end
    end
end
