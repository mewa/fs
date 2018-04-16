#!/usr/bin/env ruby

arg = ARGV[0]

if arg == nil
  STDERR.print "You have to supply an expression"
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
      STDERR.print "Invalid number of args when trying to perform '#{arg}' on #{args}"
      exit 1
    end
    acc = acc.take(acc.length - 2)
    acc << eval("lambda { |a, b| a #{arg} b }").call(*args)
  else
    number = Float(arg) rescue nil
    if number.nil?
      STDERR.print "'#{arg}' is not a number"
      exit 1
    end
    acc << number
  end
  acc
end

if ret.length > 1
  STDERR.print "Error, not all input consumed: #{ret}"
  exit
end

print ret[0]
