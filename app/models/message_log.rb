class MessageLog < ActiveRecord::Base
 belongs_to :app_config
 attr_accessor :from, :country, :state, :call_sid, :menu_digit, :recording_url, :recording_sid
 

 
end
