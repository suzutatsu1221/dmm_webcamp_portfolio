class YoutubesController < ApplicationController
	GOOGLE_API_KEY = Rails.application.credentials.google[:api_key]

	def find_videos(keyword, after: 1.year.ago, before: Time.now)
		service = Google::Apis::YoutubeV3::YouTubeService.new
		service.key = GOOGLE_API_KEY

		next_page_token = nil
		opt = {
			q: keyword,
			type: 'video',
			max_results: 5,
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

		@youtube_data = find_videos(params[:search])
	end

	def search
	end
end
