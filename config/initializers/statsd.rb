require "statsd-ruby"

statsd = Statsd.new "localhost", 9125
    

require 'socket'

conn = TCPSocket.new '4f1cd93e.carbon.hostedgraphite.com', 2003
conn.puts "449225a8-53a7-42ba-ab74-f694751f43d0.rails.boot 1\n"
conn.puts "449225a8-53a7-42ba-ab74-f694751f43d0.photo.upload 10\n"
conn.close