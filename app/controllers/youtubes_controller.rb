class YoutubesController < ApplicationController
	GOOGLE_API_KEY = Rails.application.credentials.google[:api_key]

	def find_videos(keyword, after: 1.year.ago, before: Time.now)
		service = Google::Apis::YoutubeV3::YouTubeService.new
		service.key = GOOGLE_API_KEY

		next_page_token = nil
		opt = {
			q: keyword,
			type: 'video',
			max_results: 3,
			order: :viewCount,
			page_token: next_page_token,
			published_after: after.iso8601,
			published_before: before.iso8601,
			#safeSearch: :moderate,
			#channelTitle: :string  #入れるとエラー出る
		}
		service.list_searches(:snippet, opt)

	end

	def index
		@search_word = Search.find_by(search_name: params[:search])

	    if @search_word
	    	count = @search_word.search_count + 1
	    	@search_word.update(search_count: count)
	    else
		  @search_word = Search.new(search_name: params[:search])
	      @search_word.save
	    end
		@youtube_data = find_videos(params[:search])

		@search_ranks = Search.all.order(search_count: :asc).limit(10)
	end

	def search
		@search_ranks = Search.all.order(search_count: :desc).limit(10)
	end
end
