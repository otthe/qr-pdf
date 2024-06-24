require 'hexapdf'
require 'rqrcode'
require 'chunky_png'
require 'stringio'


module QRPdf
  class Document
    def initialize(qr_url, filename, output_folder, qr_size = 120)
      @qr_url = qr_url
      @filename = filename
      @output_folder = output_folder
      @qr_size = qr_size
    end

    def find_corners(page, qr_size)
      dimensions = page[:MediaBox]
      width = dimensions[2]
      height = dimensions[3]

      # [x,y]
      {
        'top-left' => [0, height - qr_size],
        'top-right' => [0 + (width - qr_size), height - qr_size],
        'bottom-left' => [0, 0],
        'bottom-right' => [0 + (width - qr_size), 0]
      }
    end

    def create_qr(url, qr_size)
      qr = RQRCode::QRCode.new(url)
      qr.as_png(
        bit_depth: 1,
        border_modules: 2,
        color_mode: ChunkyPNG::COLOR_GRAYSCALE,
        color: "black",
        file: nil,
        fill: "white",
        module_px_size: 6,
        resize_exactly_to: true,
        resize_gte_to: false,
        size: qr_size
      )
    end

    def execute
      doc = HexaPDF::Document.open(@filename)
      page = doc.pages[0]
      canvas = page.canvas(type: :overlay)
      corners = find_corners(page, @qr_size)

      png = create_qr(@qr_url, @qr_size)
      png_binary = png.to_blob
      png_io = StringIO.new(png_binary)

      image = doc.images.add(png_io)

      #canvas.image(image, at: corners['bottom-right'], width: @qr_size)
      puts corners
      p png
    end
  end
end