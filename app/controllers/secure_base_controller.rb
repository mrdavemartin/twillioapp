class SecureBaseController < ApplicationController
  before_filter :check_ssl
  
  if Rails.env.production?
    http_basic_authenticate_with :name => "xx", :password => "xx"
  end
  
  def check_ssl
    if Rails.env.production?
      if !request.ssl?
        redirect_to :protocol => 'https'
      end
    end  
  end
  
  
end
