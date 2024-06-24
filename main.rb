#!/usr/bin/env ruby

require_relative 'lib/QRPdf'

if __FILE__ == $0
  instance = QRPdf::Document.new
  instance.create_qr
end