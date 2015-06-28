# config/unicorn.rb
if ENV["RAILS_ENV"] == "development"
  worker_processes 1
  timeout 600
else
  worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
  timeout 15
end

listen ENV['PORT'], :backlog => Integer(ENV['UNICORN_BACKLOG'] || 200)

preload_app true

before_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end  

after_fork do |server, worker|

  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end
  #added to set pool size to allow for 2 orphaned connections and the reaper to get rid of any
  config = Rails.application.config.database_configuration[Rails.env]
  config['reaping_frequency'] = ENV['DB_REAP_FREQ'] || 10 # seconds
  config['pool']              = ENV['DB_POOL'] || 5
   
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
    
  if Rails.env.development?
    require 'byebug'
    Byebug.wait_connection = true
      def find_available_port
        server = TCPServer.new(nil, 0)
        server.addr[1]
      ensure
        server.close if server
      end
    port = find_available_port
    puts "Remote debugger on port #{port}"
    #Debugger.start_remote(nil, port)
    Byebug.start_server(nil,port)
  end

  
    
end