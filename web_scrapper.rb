# frozen_string_literal: true

require 'open-uri'
require 'time'
require 'nokogiri'
require 'byebug'

# web_scrapper.rb
class WebScrapper
  attr_accessor :url, :filename, :metadata

  def initialize(url)
    @url = url
    @filename = "web_pages/#{File.basename(url)}.html"
    @metadata = {}
  end

  def fetch
    file = File.open(filename, 'w')
    data = URI.open(url).read
    file.puts(data)

    update_metadata(data)
  rescue StandardError => e
    puts "Error fetching #{url}: #{e}"
  end

  def update_metadata(data)
    doc = Nokogiri::HTML(data)
    @metadata.merge!({
      site: url,
      num_links: doc.css('a').size,
      images: doc.css('img').size,
      last_fetch: Time.now.utc.strftime("%a %b %d %Y %H:%M %Z")
    })
  end

  def print_metadata
    puts "Metadata for #{url}:"
    @metadata.each do |k, v|
      puts "#{k}: #{v}"
    end
  end
end

if ARGV.empty?
  puts 'Usage: ./web_scrapper.rb URL1 [URL2] [URL3] ...'
  exit
end

scrappers = ARGV.map { |url| WebScrapper.new(url) }
scrappers.each(&:fetch)
scrappers.each(&:print_metadata)
