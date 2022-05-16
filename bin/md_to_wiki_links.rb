# Convert markdown to mediawiki links
require "rubygems"
require_relative "../lib/link_converter"

def usage
  puts "md_to_wiki_links.rb FILENAME"
end

if ARGV.count != 1
  $stderr.puts "You need to specify a filename!"
  usage
  exit
end

filename = ARGV[0]

unless File.exists?(filename)
  $stderr.puts "#{filename} does not exist!"
  exit
end

contents = File.read(filename)
puts LinkConverter.convert(contents)
