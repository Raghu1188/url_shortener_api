class Api::V1::UrlsController < ApplicationController

	def create
    url = Url.new(url_params)
    if url.save
      render json: { original_url: url.original_url, short_url: short_url(url.short_code) }, status: :created
    else
      render json: { errors: url.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end
