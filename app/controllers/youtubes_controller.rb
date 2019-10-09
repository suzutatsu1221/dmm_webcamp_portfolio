class YoutubesController < ApplicationController
	GOOGLE_API_KEY = Rails.application.credentials.google[:api_key]

	def find_videos(keyword, after: 1.year.ago, before: Time.now)
		service = Google::Apis::YoutubeV3::YouTubeService.new
		service.key = AIzaSyCwYwYxXSuTlAFUOxnzmZyYajTrdAWtovo

		next_page_token = nil
		opt = {
			q: keyword,
			type: 'video',
			max_results: 10,
			order: :date,
			page_token: next_page_token,
			published_after: after.iso8601,
			published_before: before.iso8601
		}
		service.list_searches(:snippet, opt)
	end

	def index
		@youtube_data = find_videos('ラファエル')
	end
end
