class UrlsController < ApplicationController

	def index
		@url = Url.all
	end

	def new
		@url =Url.new
	end

	def create
	  @url = Url.new(url_params)
	  @url.shorten
   	if @url.save
     redirect_to urls_path	
    else
     @errors = @url.errors.full_messages
     render "new"
    end
	end



	private

	def url_params
	  params.require(:url).permit(:long_url)
	end

end	