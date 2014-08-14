require 'rubygems'
require 'ptools'

require 'version'

DEFAULT_IGNORES = %w(
  .hg/
  .svn/
  .git/
  .git
  .gitignore
  node_modules/
  .vagrant/
  Gemfile.lock
  .exe
  .bin
  .png
  .jpg
  .jpeg
  .svg
  .min.js
  -min.js
)

#
# Parse, model, and print a misspelling
#
class Misspelling
  attr_accessor :filename, :line, :column, :word, :suggestions

  def self.parse(filename, aspell_line)
    match = aspell_line.match(/^\&\s(.+)\s([0-9]+)\s([0-9]+)\:\s(.+)$/)

    w = match[1]
    l = match[2]
    c = match[3]
    s = match[4]

    Misspelling.new(filename, w, l, c, s)
  end

  def initialize(filename, word, line, column, suggestions)
    @filename = filename
    @word = word
    @line = line
    @column = column
    @suggestions = suggestions
  end

  def to_s
    "#{filename}:#{line}:#{column} #{word}: #{suggestions}"
  end
end

def self.recursive_list(directory, ignores = DEFAULT_IGNORES)
  Find.find(directory).reject do |f|
    File.directory?(f) ||
    ignores.any? { |ignore| f =~ /#{ignore}/ } ||
    File.binary?(f)
  end
end

def self.check(filename)
  output = `sed 's/#/ /g' "#{filename}" 2>&1 | aspell -a -c 2>&1`

  lines = output.split("\n").select { |line| line =~ /^\&\s.+$/ }

  misspellings = lines.map { |line| Misspelling.parse(filename, line) }

  misspellings.each { |m| puts m }
end
