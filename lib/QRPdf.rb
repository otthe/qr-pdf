require_relative 'hexapdf'

module QRPdf
  class Document
    
    def initialize(qr_url, filename, output_folder)
      @qr_url = qr_url
      @filename = filename
      @output_folder = output_folder

      @qr_size = 120

      @doc = HexaPDF::Document.open(@name)
      @page = @doc.pages[0]

      @positions = {
        "top-left" => [],
        "top-right" => [],
        "bottom-left" => [],
        "bottom-right" => []
      }
    end

    def create_qr
      puts "Hello"
    end

    def execute
      create_qr
      write_to_doc
      save_new_doc
    end
  end
end