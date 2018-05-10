require 'rails_helper'

RSpec.describe Api::MemorialNoticesController, type: :controller do

    describe 'POST #create' do
        context 'user not logged in or invalid JWT' do
            it 'returns unauthorized http status' do
                request.headers["ACCEPT"] = "application/json"
                post :create
                expect(response).to have_http_status(401)    
            end
        end
      
        context 'user logged in' do
            before do
                test_user = create(:user)
                sign_in test_user
            end
            it 'associates with the memorial notice the user we expect' do
                #this association is made in the controller not via the params
                post :create, params:{memorial_notice:{first_name: "Jenny", last_name: "Miles", date_of_death: "24/08/1987", after_nightfall: true}}
                expect(MemorialNotice.first.user.email).to eq("sami@sami.com")
            end
            it 'adds a record to the database' do
                expect {post :create, params:{memorial_notice:{first_name: "Jenny", last_name: "Miles", date_of_death: "24/08/1987", after_nightfall: true}}}.to change{MemorialNotice.all.count}.by(1)
            end
            it 'returns http status 201' do
                post :create, params:{memorial_notice:{first_name: "Jenny", last_name: "Miles", date_of_death: "24/08/1987", after_nightfall: true}}
                expect(response).to have_http_status(201)
            end
            it 'renders some json for the user' do
                post :create, params:{memorial_notice:{first_name: "Jenny", last_name: "Miles", date_of_death: "24/08/1987", after_nightfall: true}}
                json = JSON.parse(response.body)
                expect(json["memorial_notice"]["first_name"]).to eq("Jenny")
                expect(json["memorial_notice"]["child1"]).to be_nil
                expect(json["memorial_notice"]["user"]["email"]).to eq("sami@sami.com")
            end
        end
    end

end
