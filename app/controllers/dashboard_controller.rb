class DashboardController < ApplicationController
  before_action :confirm_two_factor_authenticated

  def index
  end
end
