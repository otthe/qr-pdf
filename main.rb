#!/usr/bin/env ruby

require_relative 'lib/QRPdf'

if __FILE__ == $0
  instance = QRPdf::Document.new("https://www.omavalvo.fi","/home/null/Desktop/lomakkeet/scripts/qr-pdf/testi.pdf", "tmp")
  instance.execute
end