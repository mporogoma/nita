class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def index
    @users = User.all
  end

  def update_role
    user = User.find(params[:id])
    if params[:role] == 'admin'
      user.add_role(:admin)
      user.remove_role(:seller)
    else
      user.add_role(:seller)
      user.remove_role(:admin)
    end
    redirect_to admin_users_path, notice: 'User role updated successfully.'
  end

  def invite
    email = params[:email]
    role = params[:role]
    
    user = User.invite!({ email: email }, current_user)
    user.add_role(role)
    
    redirect_to admin_users_path, notice: "Invitation sent to #{email}"
  end

  private

  def authorize_admin
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin?
  end
end