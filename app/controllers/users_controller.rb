class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def index
    @users = User.all
  end

  def invite
    user_to_invite = User.find(params[:info][:user_id])
    event_to_invite_to = Event.find(params[:info][:event_id])
    user_to_invite.attended_events << event_to_invite_to
    redirect_to event_to_invite_to
  end

  def show
    @user = User.find(params[:id])
    @events = @user.created_events
    @Aevents = @user.attended_events
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		log_in @user
      remember @user
  		flash[:success] = "Welcome to the sample app"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
