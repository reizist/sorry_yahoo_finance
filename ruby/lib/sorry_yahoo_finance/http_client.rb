require 'open-uri'
require 'nokogiri'

module HttpClient
  def self.get(url)
    begin
      html = URI.open(url).read
    rescue URI::InvalidURIError
      url = URI.encode(url)
      html = URI.open(url, "Accept-Encoding" => "utf-8")
    rescue Zlib::DataError
      html = URI.open(url, "Accept-Encoding" => "utf-8")
    end
    Nokogiri::HTML(html, url)
  end
end
