class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_admin!

  def top
  end

  def about
  end

end
