module App
  class AppController < ApplicationController
    layout 'app/app_layout'
    before_action :authenticate_user!
  end
end