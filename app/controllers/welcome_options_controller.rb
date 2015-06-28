class WelcomeOptionsController < ApplicationController
    skip_before_filter :verify_authenticity_token #twilio does not handle csrf
  def index
      respond_to do |format|
        format.xml
      end
  end
    
  def create 
    respond_to do |format|
      if menu_selection.blank? || menu_selection.to_i > 2
        #repeat instructions location:header
        #response.headers["Location"]="welcome_options.xml"
        format.xml {redirect_to welcome_options_path(format: :xml)}
       # format.xml {render inline:%Q|<?xml version="1.0" encoding="UTF-8"?>\n<Response>\n<Redirect>\nwelcome_options.xml\n</Redirect>\n</Response>|}
#   format.xml {render inline:""}
      else 
        load_data
        if @call_status=="completed" or @contact.blank?
          #ask to leave a message
          format.xml{render inline:%Q|<?xml version="1.0" encoding="UTF-8"?>\n<Response>\n<Say voice="woman">Everyone is busy, please leave a message, press any key to finish</Say>\n<Record action="#{log_and_alert_path(format: :xml)}?menu_digits=#{@digits}" method="GET" maxLength="30" />\n</Response>|}
          #hang up 
          #format.xml{render inline:%Q|<?xml version="1.0" encoding="UTF-8"?>\n<Response>\n<Hangup/>\n</Response>|}
        else
          format.xml
        end
        
      end   
    end
  end

  
  private
  
  def menu_selection
    return params['Digits'] unless params['Digits'].blank?
    return params['menu_digits'] unless params['menu_digits'].blank?
    return ""
  end
  
  def load_data
    @attempt= params['id'].blank? ? 0 : params['id'].to_i
    @digits = menu_selection
    @call_status = params['DialCallStatus'].blank? ? "" : params['DialCallStatus']
    loop do
      @contact = Contact.contacts_for_digit(@digits,  @attempt)
      break if @contact.blank?
      break if Contact.working(@contact)
      @attempt += 1  
    end
    
  end
  
  def load_contact
    
  end
  

end
