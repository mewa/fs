#!/usr/bin/env ruby

arg = ARGV[0]

if arg == nil
  STDERR.puts "You have to supply an expression"
  exit
end

OPS = ["+", "-", "*", "/"]

def isOp(arg)
  OPS.include? arg
end

ops = arg.split " "

ret = ops.inject([]) do |acc, arg|
  if isOp arg
    args = acc.last(2)
    if args.length < 2
      STDERR.puts "Invalid number of args when trying to perform '#{arg}' on #{args}"
      exit
    end
    acc = acc.take(acc.length - 2)
    acc << eval("#{args[0]} #{arg} #{args[1]}")
  else
    acc << arg
  end
  acc
end

if ret.length > 1
  STDERR.puts "Error, not all input consumed: #{ret}"
  exit
end

puts ret[0]
