#!/bin/env ruby
# encoding: utf-8
class CallOption

  def self.options
   return [{name:'Sales', digits:'1', yammer_group_id:"3840521"},
            {name:'Technical', digits:'2',yammer_group_id:"3840522"} ] 
  end

  def self.option_for_digits(digits)
    return false if digits.blank?
    
    self.options.each do |opt|
      return opt if opt[:digits] == digits.to_s
    end
    return false
  end
  

end