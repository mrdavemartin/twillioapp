#!/bin/env ruby
# encoding: utf-8
require 'yammer'
class YammerConnect

  def self.oauth_client
  
    api_key =  ENV['yammer_client_id']
    api_secret =  ENV['yammer_client_secret']

        OAuth2::Client.new(
       api_key, 
            api_secret, 
            :authorize_url => "https://www.yammer.com/dialog/oauth?client_id=#{api_key}&redirect_uri=#{ENV['yammer_redirect_uri']}", 
            :token_url => "/oauth2/access_token.json", 
            :site => "https://www.yammer.com",
            :connection_opts => {:request=>{:timeout => 20,:open_timeout => 20} }
          )  
       # api_key, 
       #       api_secret, 
       #       :authorize_url =>  "https://www.linkedin.com/uas/oauth2/authorization", 
       #       :token_url => "https://www.linkedin.com/uas/oauth2/accessToken", 
       #       :site => "https://www.linkedin.com",
       #       :connection_opts => {:timeout => 20,:open_timeout => 20 }
       #     )  
      
  end
  
  def self.access_token(token)
  #need a way to store access token and rebuild
    access_token = OAuth2::AccessToken.new(oauth_client, token, {
          :mode => :query,
          :param_name => "oauth2_access_token",
    })
  
  end
  
  def self.alert_yammer(token,message, og_url,group_id)
    
    #test
    # token = "kjeNyRwlacRbReCfhAQxA"
#     message = "TEST VOICEMAIL ALERT"
#     og_url = "http://api.twilio.com/2010-04-01/Accounts/ACa6fc6d8c8db30cf5004ea5a49cf56389/Recordings/RE03a02f0bca29e1becbc7a9f158643396"
#     group_id = "3840522"
    Yammer.configure do |c|
      c.client_id=ENV['yammer_client_id']
      c.client_secret=ENV['yammer_client_secret']
    end
    yamr = Yammer::Client.new(access_token: token)
    yamr.create_message(message, og_url: og_url, group_id:group_id)
    
    # {
    # "activity":{
    # "actor":{"name":"Sidd Singh",
    # "email":"sidd@xyz.com"},
    # "action":"create",
    # "object": {
    # "url":"https://www.sched.do",
    # "title":"Lunch Meeting"
    # },
    # "message":"Hey, let’s get sushi!",
    # "users":[
    # {"name":"Adarsh Pandit",
    # "email":"adarsh@xyz.com"}
    # ]
    # }
    # }
    
    
  end
  
end