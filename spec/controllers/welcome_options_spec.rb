require 'spec_helper'

describe WelcomeOptionsController do

  before do
    @twilio_params =  {"AccountSid"=>"ACa6fc6d8c8db30cf5004ea5a49cf56389", "ToZip"=>"", "FromState"=>"", "Called"=>"+442033229948", "FromCountry"=>"GB", "CallerCountry"=>"GB", "CalledZip"=>"", "Direction"=>"inbound", "FromCity"=>"", "CalledCountry"=>"GB", "CallerState"=>"", "CallSid"=>"CA6bc7fdad657ea06c634610b8b255a61e", "CalledState"=>"London", "From"=>"+447753775312", "CallerZip"=>"", "FromZip"=>"", "CallStatus"=>"in-progress", "ToCity"=>"", "ToState"=>"London", "To"=>"+442033229948", "Digits"=>"", "ToCountry"=>"GB", "msg"=>"Gather End", "CallerCity"=>"", "ApiVersion"=>"2010-04-01", "Caller"=>"+447753775312", "CalledCity"=>""}
    request.env["HTTP_ACCEPT"] = 'application/xml'
  end
  
  context "GET #index" do
    render_views false
    it "responds with 200" do
              get :index,  @twilio_params
              assert_response 200
    end
    
  end
  
  context "POST #create" do
    render_views
    describe "digit press 2" do
      before do
        @twilio_params["Digits"]="2"
        post :create,  @twilio_params

      end
      
      it "responds with 200" do
        assert_response 200
      end
        
      it "dials to 447753775312" do
        expect(response.body).to match /447753775312/m
      end
      
      it "the digit appears on querystring of action" do
        expect(response.body).to match /menu_digits=2/m
      end
      
      it "attempts are on action querystring" do
        expect(response.body).to match /id=1/m
      end
       
    end
    
    describe "repeat call attempts" do
      it "increments attempt" do
          @twilio_params["Digits"]=""
          @twilio_params["menu_digits"]="2"
          @twilio_params["id"]="1"
         post :create,  @twilio_params
         
         expect(response.body).to match /id=2/m
      end
  
      it "hangs up on after last try" do
        @twilio_params["Digits"]=""
        @twilio_params["menu_digits"]="2"
        @twilio_params["id"]="2"
        post :create,  @twilio_params
     
        expect(response.body).to match /Hangup/m
       end
  
    end
    
  
    
    describe "digit press 8" do
      before do
        @twilio_params["Digits"]="8"
        post :create,  @twilio_params

      end
      
      it "responds with 200" do
        assert_response 302
      end
        
      it "redirects back to options" do
        expect(response.body).to match /welcome_options/m
      end
      
    end
  end
  
  # context "GET #show" do
#     render_views
#     
#     describe "calls second person" do
#       
#       before do
#         @twilio_params["Digits"]="2"
#         show_params=@twilio_params
#         show_params["id"]=1
#         get :show, show_params
#       end
#       
#       it "responds with 200" do
#         assert_response 200
#       end
#       
#       it "dials number" do
#         expect(response.body).to match /Dial/m
#       end
#       
#     end
#     
#   end
  
end