class RedirectsController < ApplicationController
  before_action :set_url, only: :redirect

  def redirect
    if @url
      redirect_to @url.long
      ClickCountJob.perform_later url: @url, ip: Rails.env.production? ? request.remote_ip : request.ip
    else
      render 'errors/not_found'
    end
  end

  private

  def redirect_params
    params.permit(:short_url)
  end

  def set_url
    @url = Url.find_by(short: redirect_params[:short_url])
  end

end