require_relative 'version'
require_relative 'cli'

require 'ptools'
require 'tempfile'

DEFAULT_IGNORES = %w(
  .hg
  .svn
  .git
  .aspelllintignore
  .gtdlintignore
  .gtdlintrc.yml
  node_modules
  bower_components
  target
  dist
  .vagrant
  Gemfile.lock
  *.exe
  *.bin
  *.apk
  *.ap_
  res
  *.class
  *.zip
  *.jar
  *.war
  *.xpi
  *.dmg
  *.pkg
  *.app
  *.xcodeproj
  *.lproj
  *.xcassets
  *.pmdoc
  *.dSYM
  *.jad
  *.cmo
  *.cmi
  *.png
  *.gif
  *.jpg
  *.jpeg
  *.tiff
  *.ico
  *.svg
  *.dot
  *.wav
  *[.-]min.*
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

module Aspelllint
  def self.check_stdin
    contents = $stdin.read

    t = Tempfile.new('aspelllint')
    t.write(contents)
    t.close

    filename = t.path

    output = `sed 's/#/ /g' "#{filename}" 2>&1 | aspell -a -c 2>&1`

    if output =~ /aspell\: command not found/m
      puts 'aspell: command not found'
    else
      lines = output.split("\n").select { |line| line =~ /^\&\s.+$/ }

      misspellings = lines.map { |line| Misspelling.parse('stdin', line) }

      misspellings.each { |m| puts m }

      t.delete
    end
  end

  def self.check(filename)
    output = `sed 's/#/ /g' "#{filename}" 2>&1 | aspell -a -c 2>&1`

    if output =~ /aspell\: command not found/m
      puts 'aspell: command not found'
    else
      lines = output.split("\n").select { |line| line =~ /^\&\s.+$/ }

      misspellings = lines.map { |line| Misspelling.parse(filename, line) }

      misspellings.each { |m| puts m }
    end
  end
end
