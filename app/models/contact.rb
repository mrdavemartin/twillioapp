#!/bin/env ruby
# encoding: utf-8
class Contact

  def self.phones

    return {jimmy:{mobile:'+447111111111', other:'07761460840', name:'Bill', timeout:10, start_time:"09:00:00 UTC", end_time:"17:30:00 UTC", on_leave:false},
            dave:{mobile:'+447111111111', name:'Dave', timeout:10 ,start_time:"09:00:00 UTC", end_time:"17:30:00 UTC",on_leave:false}, 
            matt:{mobile:'+447111111111', name:'Bob', timeout:10 ,start_time:"09:00:00 UTC", end_time:"17:30:00 UTC",on_leave:false}
             }    
  end

  def self.sales_contacts
    return [self.phones[:jimmy], self.phones[:matt]]
  end
  
  def self.tech_contacts
   # return [self.phones[:dave], self.phones[:matt]]
     return [self.phones[:dave], self.phones[:dave]]
  end
  
  def self.sales(preference_order)
    return false if preference_order > (self.sales_contacts.count-1)
    return self.sales_contacts[preference_order]  
  end

  def self.tech(preference_order)
    return false if preference_order > (self.tech_contacts.count-1)
    return self.tech_contacts[preference_order]  
  end
  
  def self.contacts_for_digit(digit, attempt)
    case digit
    when "1"
      return self.sales(attempt)
    when "2"
      return self.tech(attempt)      
    else 
      return false
    end
  end
  
  def self.working(contact)
    
    return false if contact[:on_leave]
    #could add timezones then will work for Ben etc.
    start_time = Time.parse(contact[:start_time])
    end_time = Time.parse(contact[:end_time])
    time_now = Time.now.utc
    return true if time_now > start_time && time_now < end_time
    return false
    
  end

end
