require 'rubygems'
require 'redis'

def bench(descr)
  start = Time.now
  yield
  puts "#{descr} #{Time.now - start} seconds"
end

def without_pipelining
  r = Redis.new(host: "10.148.0.3", port: 40000)
  10_000.times do
    r.ping
  end
end

def with_pipelining
  r = Redis.new(host: "10.148.0.3", port: 40000)
  r.pipelined do
    10_000.times do
      r.ping
    end
  end
end

bench('without pipelining') do
  without_pipelining
end
bench('with pipelining') do
  with_pipelining
end
