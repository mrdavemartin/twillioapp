# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    
ap = AppConfig.create 
ap.name="threesparks"
ap.yammer_auth_token=""
ap.yammer_client_code="xx"
ap.yammer_client_secret="xx"
ap.save
