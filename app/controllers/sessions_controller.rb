class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user
        if user.try(:authenticate,params[:user][:password])
            session[:user] = {:id => user.id, :name => user.name}
            flash[:success]='You have been logged in'
            redirect_to root_path
        else
            flash[:danger]='Invalid password'
            redirect_to login_path
        end
    else
        flash[:danger]='Unknown email please signup.'
        redirect_to login_path
    end
  end

  def destroy
    reset_session # ruby method to end session - not good for follow-up marketing, etc. good for simple sign up tho
    redirect_to root_path
  end


end
