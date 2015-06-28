class ScreeningController < ApplicationController
    skip_before_filter :verify_authenticity_token #twilio does not handle csrf
  def screen
      respond_to do |format|
        @call_option = CallOption.option_for_digits(menu_selection) 
        format.xml
      end
  end
  
  def connect
      respond_to do |format|
        format.xml
      end
  end
  
   
  def menu_selection
    return params['Digits'] unless params['Digits'].blank?
    return params['menu_digits'] unless params['menu_digits'].blank?
    return ""
  end
end