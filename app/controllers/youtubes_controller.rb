class YoutubesController < ApplicationController
	GOOGLE_API_KEY = Rails.application.credentials.google[:api_key]

	def find_videos(keyword, after: 2.year.ago, before: Time.now)
		service = Google::Apis::YoutubeV3::YouTubeService.new
		service.key = GOOGLE_API_KEY

		next_page_token = nil
		opt = {
			q: keyword,
			type: 'video',
			max_results: 50,
			order: :viewCount,
			page_token: next_page_token,
			published_after: after.iso8601,
			published_before: before.iso8601
		}
		service.list_searches(:snippet, opt)

	end

	def index
		#データ取ってくる
		@youtube_data = find_videos(params[:search])

		#配列に入れる
		array = []
		@youtube_data.items.each do |item|
			array.push({
				title: item.snippet.title,
				description: item.snippet.description,
				channel_title: item.snippet.channel_title,
				published_at: item.snippet.published_at,
				video_id: item.id.video_id
			})
		end

		#ページネーション
		@searched_results = Kaminari.paginate_array(array).page(params[:page]).per(10)

		#検索ランキング
		@search_word = Search.find_by(search_name: params[:search])
	    if @search_word
	    	count = @search_word.search_count + 1
	    	@search_word.update(search_count: count)
	    else
		  @search_word = Search.new(search_name: params[:search])
	      @search_word.save
	    end

		@search_ranks = Search.all.order(search_count: :asc).limit(10)
	end

	def search
		@search_ranks = Search.all.order(search_count: :desc).limit(10)
	end
end
