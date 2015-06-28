class YammerAuthController < SecureBaseController


  
  #sign in with Yammer
  def index
    @auth_url = "https://www.yammer.com/dialog/oauth?client_id=#{ENV['yammer_client_id']}&redirect_uri=#{redirect_url}"
  end
  
  #oAuth Accept
  def new
  #  yammer_client = Yammer::OAuth2Client.new(ENV['yammer_client_id'], ENV['yammer_client_secret'])
   # response_raw = yammer_client.access_token_from_authorization_code(params[:code], {redirect_uri:ENV['yammer_redirect_uri']})
   
   begin
      token = client.auth_code.get_token(params[:code], :redirect_uri => redirect_url)
      yammer_response = JSON.parse(token.token.gsub(/:([a-zA-z])/,'\\1').gsub('=>', ' : ').gsub('nil','""')) 
    
      auth_token = yammer_response["token"]
      ap = AppConfig.find_by_name("threesparks")
      ap.yammer_auth_token=auth_token
      ap.save
       flash[:notice]="Yamemr Authentication is ready"
    rescue
      if ap.yammer_auth_token.blank?
        flash[:notice]="Authentication Failed, please try again"
      else
        flash[:notice]="Yamemr Authentication is ready"
      end
    end


  end
  
  def client
    YammerConnect.oauth_client
  end 
    
  def redirect_url
    ENV['yammer_redirect_uri']
  end
  
 
  
end