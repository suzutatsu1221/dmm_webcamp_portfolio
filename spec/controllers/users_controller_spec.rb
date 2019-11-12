require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe 'トップページ' do
        context "トップページが正しく表示される" do
            before do
                get :top
            end
            it 'リクエストは200 OKとなること' do
                expect(response.status).to eq 200
            end
        end
    end
    describe 'トップページ' do
        context "トップページが正しく表示される" do
            render_views
            it 'タイトルが正しく表示される' do
                expect(response.body).to include("動画")
            end
        end
    end
end
