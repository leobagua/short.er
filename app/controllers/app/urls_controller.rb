module App
  class UrlsController < AppController
    before_action :url_params, only: [:create, :update]
    before_action :set_url, only: [:show, :edit, :update]

    def index
      @urls = Url.from_current_user(current_user).paginate(page: params[:page], per_page: 3)
    end

    def show
      @url_clicks_info = ClickService.clicks_info_from(@url.id)
    end

    def new
      @url = Url.new
      respond_to &:js
    end

    def create
      @url = UrlService.create_url url_params.merge(user: current_user)
      respond_to do |format|
        format.js do
          if @url.has_saved?
            render js: "window.location = '#{app_urls_path}';"
          else
            render action: 'edit'
          end
        end
      end
    end

    def edit; end

    def update
      UrlService.update_url(@url, url_params)
      respond_to do |format|
        format.js do
          if @url.has_updated?
            render js: "window.location = '#{app_urls_path}';"
          else
            render action: 'edit'
          end
        end
      end
    end

    private

    def url_params
      @params = params.require(:url).permit(:description, :long)
    end

    def set_url
      @url = Url.find_by(id: params[:id], user: current_user)
    end
  end
end