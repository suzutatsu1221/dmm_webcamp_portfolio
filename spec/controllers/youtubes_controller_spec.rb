require 'rails_helper'

RSpec.describe YoutubesController, type: :controller do
	describe 'searchページ' do
		context 'searchページが正しく表示されること' do
			before do
				get :search
			end
			it 'リクエストは200 OKとなること' do
				expect(response.status).to eq 200
			end
		end
	end
	describe 'indexページ' do
		context 'indexページが正しく表示されること' do
			before do
				get :index
			end
			it 'リクエストは200 OKとなること' do
				expect(response.status).to eq 200
			end
		end
	end
end
