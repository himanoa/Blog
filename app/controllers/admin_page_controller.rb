class AdminPageController < ApplicationController
  before_action :logged_in_user, only: [:entries]
  def entries
    @entries = Entry.all
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end
end
