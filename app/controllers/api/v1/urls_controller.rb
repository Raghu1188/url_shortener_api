class Api::V1::UrlsController < ApplicationController
	before_action :authenticate_client!, only: [:create]
	before_action :find_url, only: [:redirect]

	def create
    url = Url.new(url_params)
    if url.save
      render json: { original_url: url.original_url, short_url: short_url(url.short_code) }, status: :created
    else
      render json: { errors: url.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def redirect
    if @url
      redirect_to @url.original_url, allow_other_host: true
    else
      render json: { error: 'URL not found' }, status: :not_found
    end
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end

  def find_url
    @url = Url.find_by(short_code: params[:short_code])
  end

  def short_url(code)
    "#{request.base_url}/#{code}"
  end

end
