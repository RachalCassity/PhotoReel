require "statsd-ruby"

statsd = Statsd.new "localhost", 9125

statsd = Statsd.new '::1', 9125



statsd.increment("photo.uploads")
