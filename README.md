# QR-PDF
Dynamically generates and adds QR code to one of the four corners of your one page PDF. 
<br>Generated PDF will be saved into a new folder with the same name as the input file.

## Position options
You can choose which corner the QR code will be placed via following strings:
```
"top-left" || "top-right" || "bottom-left" || "bottom-right"
```

## CLI Usage
```
# With default size
ruby qrpdf.rb --url "https://example.com" --corner "bottom-right" --filename "test.pdf" --output "tmp"

# With optional size
ruby qrpdf.rb --url "https://example.com" --corner "bottom-right" --filename "test.pdf" --output "tmp" --size 96 
```

## Library Usage
```
require_relative 'lib/QRPdf'

qr_url = "https://example.com"
corner = "top-left"
filename = "test.pdf"
output_folder = "tmp"
size = 96

doc = QRPdf::Document.new(
  qr_url,
  corner,
  filename,
  output_folder,
  size
)

doc.execute

```

## Things to consider
* This library only supports one page PDF's for now (although you can easily modify this for your needs) <br>
* No tests currently