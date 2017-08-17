#!/usr/bin/env ruby
require 'socket'

# Commandline example:
# $ ./wait-for-service.rb [hostname.tld] [port] [max_retries] [initial_wait] [wait_factor (float)]
host = ARGV[0].to_s
port = ARGV[1].to_i
max_retries = ARGV[2]
initial_wait = ARGV[3].to_i
wait_factor = ARGV[4].to_f

wait = initial_wait
round = 1
loop do
  begin
    puts "🔍\tChecking for service at #{host}:#{port} ..."
    s = TCPSocket.new host, port
    puts "✔\tService available!"
    s.close
    break
  rescue Errno::ECONNREFUSED
    wait = (wait * (round * wait_factor)).to_i
    puts "⏳\tWaiting #{wait} seconds before retrying."
    sleep wait


    exit(1) if round == max_retries
    round = round + 1
  end
  puts "--"
end
