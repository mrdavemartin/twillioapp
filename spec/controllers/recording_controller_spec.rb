# 
# Started GET "/log_and_alert.xml?menu_digits=2&AccountSid=ACa6fc6d8c8db30cf5004ea5a49cf56389&ToZip=&FromState=CA&Called=%2B442033229948&FromCountry=US&CallerCountry=US&CalledZip=&Direction=inbound&FromCity=SUNNYVALE&CalledCountry=GB&CallerState=CA&CallSid=CA694e230216e8b667866d75b258b6ef0a&CalledState=London&From=%2B14082151330&CallerZip=94085&FromZip=94085&CallStatus=in-progress&ToCity=&ToState=London&RecordingUrl=http%3A%2F%2Fapi.twilio.com%2F2010-04-01%2FAccounts%2FACa6fc6d8c8db30cf5004ea5a49cf56389%2FRecordings%2FRE96fdf689bb33eb57cc24de20e2b5f670&To=%2B442033229948&Digits=8&ToCountry=GB&RecordingDuration=5&CallerCity=SUNNYVALE&ApiVersion=2010-04-01&Caller=%2B14082151330&CalledCity=&RecordingSid=RE96fdf689bb33eb57cc24de20e2b5f670" for 127.0.0.1 at 2014-02-15 13:20:15 +0000
# Processing by RecordingController#log_and_alert as XML
#   Parameters: {"menu_digits"=>"2", "AccountSid"=>"ACa6fc6d8c8db30cf5004ea5a49cf56389", "ToZip"=>"", "FromState"=>"CA", "Called"=>"+442033229948", "FromCountry"=>"US", "CallerCountry"=>"US", "CalledZip"=>"", "Direction"=>"inbound", "FromCity"=>"SUNNYVALE", "CalledCountry"=>"GB", "CallerState"=>"CA", "CallSid"=>"CA694e230216e8b667866d75b258b6ef0a", "CalledState"=>"London", "From"=>"+14082151330", "CallerZip"=>"94085", "FromZip"=>"94085", "CallStatus"=>"in-progress", "ToCity"=>"", "ToState"=>"London", "RecordingUrl"=>"http://api.twilio.com/2010-04-01/Accounts/ACa6fc6d8c8db30cf5004ea5a49cf56389/Recordings/RE96fdf689bb33eb57cc24de20e2b5f670", "To"=>"+442033229948", "Digits"=>"8", "ToCountry"=>"GB", "RecordingDuration"=>"5", "CallerCity"=>"SUNNYVALE", "ApiVersion"=>"2010-04-01", "Caller"=>"+14082151330", "CalledCity"=>"", "RecordingSid"=>"RE96fdf689bb33eb57cc24de20e2b5f670"}
#   AppConfig Load (0.9ms)  SELECT "app_configs".* FROM "app_configs" WHERE "app_configs"."name" = 'threesparks' LIMIT 1
#   Rendered recording/log_and_alert.xml.erb (0.1ms)
# Completed 200 OK in 6538ms (Views: 24.6ms | ActiveRecord: 82.4ms)
#     request.env["HTTP_ACCEPT"] = 'application/xml'

require 'spec_helper'

describe RecordingController do

  before do
    @twilio_params = {"menu_digits"=>"2",
                      "AccountSid"=>"ACa6fc6d8c8db30cf5004ea5a49cf56389",
                      "ToZip"=>"",
                      "FromState"=>"CA",
                      "Called"=>"+442033229948",
                      "FromCountry"=>"US",
                      "CallerCountry"=>"US", 
                      "CalledZip"=>"", 
                      "Direction"=>"inbound", 
                      "FromCity"=>"SUNNYVALE", 
                      "CalledCountry"=>"GB", 
                      "CallerState"=>"CA", 
                      "CallSid"=>"CA694e230216e8b667866d75b258b6ef0a", 
                      "CalledState"=>"London", 
                      "From"=>"+14082151330", 
                      "CallerZip"=>"94085", 
                      "FromZip"=>"94085", 
                      "CallStatus"=>"in-progress", 
                      "ToCity"=>"", 
                      "ToState"=>"London", 
                      "RecordingUrl"=>"http://api.twilio.com/2010-04-01/Accounts/ACa6fc6d8c8db30cf5004ea5a49cf56389/Recordings/RE96fdf689bb33eb57cc24de20e2b5f670", 
                      "To"=>"+442033229948", 
                      "Digits"=>"8", 
                      "ToCountry"=>"GB", 
                      "RecordingDuration"=>"5", 
                      "CallerCity"=>"SUNNYVALE", 
                      "ApiVersion"=>"2010-04-01", 
                      "Caller"=>"+14082151330", 
                      "CalledCity"=>"", 
                      "RecordingSid"=>"RE96fdf689bb33eb57cc24de20e2b5f670"
                    }
    request.env["HTTP_ACCEPT"] = 'application/xml'
  end
  
end