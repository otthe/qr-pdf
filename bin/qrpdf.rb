#!/usr/bin/env ruby

require_relative '../lib/QRPdf'
require 'optparse'

if __FILE__ == $0
  options = {}
  OptionParser.new do |opts|
    opts.banner = 'Usage: main.rb [options]'
    
    opts.on('-uURL', '--url=URL', 'QR Code URL') do |u|
      options[:qr_url] = u
    end

    opts.on('-cCORNER', '--corner=CORNER', 'QR Code Corner (top-left, top-right, bottom-left, bottom-right)') do |c|
      options[:qr_corner] = c
    end

    opts.on('-fFILENAME', '--filename=FILENAME', 'Input PDF Filename') do |f|
      options[:filename] = f
    end
    
    opts.on('-oOUTPUT', '--output=OUTPUT', 'Output Folder') do |o|
      options[:output_folder] = o
    end

    opts.on('-sSIZE', '--size=SIZE', 'QR Code Size (optional)') do |s|
      options[:qr_size] = s.to_i
    end
    
  end.parse!
  
  options[:qr_size] ||= 96
  
  [:qr_url, :qr_corner, :filename, :output_folder].each do |param|
    if options[param].nil?
      puts "Missing required parameter: #{param}"
      exit
    end
  end
  
  instance = QRPdf::Document.new(
    options[:qr_url],
    options[:filename],
    options[:output_folder],
    options[:qr_corner],
    options[:qr_size]
  )
  instance.execute
end

# ruby main.rb --url "https://example.com" --corner "bottom-right" --filename "testi.pdf" --output "tmp"
# ruby main.rb --url "https://example.com" --corner "bottom-right" --filename "testi.pdf" --output "tmp" --size 96