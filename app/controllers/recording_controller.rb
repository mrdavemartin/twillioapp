class RecordingController < ApplicationController
    skip_before_filter :verify_authenticity_token #twilio does not handle csrf
  def log_and_alert
    
    @call_options = CallOption.option_for_digits(menu_selection) 
    ap = AppConfig.find_by_name("threesparks")
    ap.message_log.create(from:params[:From], country:params[:CallerCountry], state:params[:CallerState], call_sid:params[:CallSid], menu_digit:menu_selection, recording_url:menu_selection)
    
    unless ap.yammer_auth_token.blank?
      YammerConnect.alert_yammer(ap.yammer_auth_token,message, params[:RecordingUrl],  @call_options[:yammer_group_id])
    end
    
      respond_to do |format|
       
        format.xml
      end
  end
   
  def menu_selection
    return params['menu_digits'] unless params['menu_digits'].blank?
    return ""
  end
  
  private
  def message
    "Call from #{params[:From]}, on #{Date.today}, from #{params[:CallerCountry]}, #{params[:FromCity]} #{params[:CallerState]}, the message is #{params[:RecordingDuration]} seconds"
  end
    
end