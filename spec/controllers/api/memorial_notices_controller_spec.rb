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

    describe 'GET #index' do
        context 'user not logged in or invalid JWT' do
            it 'should respond with 401 unauthorized' do
                request.headers["ACCEPT"] = "application/json"
                get :index
                expect(response).to have_http_status(401)
            end
        end

        context 'user is logged in' do
            before do
                create(:memorial_notice)
                sign_in User.first
            end
            it 'should order data from the database alphabetically based on last_name and first_name before producing as JSON' do
                create(:memorial_notice, last_name: 'banam', user: create(:user, email: "g@g.com"))
                create(:memorial_notice, last_name: 'draxler', user: create(:user, email: "m@m.com"))
                create(:memorial_notice, first_name: "Abi", last_name: 'Carlton', user: create(:user, email: "k@k.com"))
                create(:memorial_notice, first_name: "Zack", last_name: 'Carlton', user: create(:user, email: "l@l.com"))
                get :index
                json = JSON.parse(response.body)
                #before_create action on model will capitalize name
                expect(json["memorial_notices"][0]["last_name"]).to eq("Banam")
                expect(json["memorial_notices"][1]["last_name"]).to eq("Carlton")
                expect(json["memorial_notices"][1]["first_name"]).to eq("Abi")
                expect(json["memorial_notices"][2]["last_name"]).to eq("Carlton")
                expect(json["memorial_notices"][2]["first_name"]).to eq("Zack")
                expect(json["memorial_notices"][3]["last_name"]).to eq("Draxler")
                expect(json["memorial_notices"][4]["last_name"]).to eq("Smith")
            end
            it 'should return all the memorial notices in the database as JSON' do
                get :index
                json = JSON.parse(response.body)
                expect(json["memorial_notices"][0]["first_name"]).to eq("Joe")
                expect(json["memorial_notices"][0]["user_id"]).to be_nil
                expect(json["memorial_notices"][0]["updated_at"]).to be_nil
                expect(json["memorial_notices"][0]["user"]["email"]).to eq("sami@sami.com")
            end
            it 'should have an http status 200' do
                get :index
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'GET #show' do
        context 'user not logged in or invalid JWT' do
            it 'should respond with 401 unauthorized' do
                request.headers["ACCEPT"] = "application/json"
                get :show, params: {id: 1}
                expect(response).to have_http_status(401)
            end
        end
        context 'user is logged in' do
            before do
                create(:memorial_notice)
                sign_in User.first
            end
            it 'returns the correct notice from the database, based on params id' do
                get :show, params: {id: 1}
                json = JSON.parse(response.body)
                expect(json["memorial_notice"]["first_name"]).to eq("Joe")
                expect(json["memorial_notice"]["id"]).to eq(1)
                expect(json["memorial_notice"]["user"]["email"]).to eq("sami@sami.com")

            end
            it 'has an http status of 200' do
                get :show, params: {id: 1}
                expect(response).to have_http_status(200)
            end
        end

        
    end

end
# params["id"]