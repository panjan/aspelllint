require_relative 'aspelllint'

require 'find'
require 'optparse'
require 'dotsmack'

require 'docopt'

USAGE = <<DOCOPT
Usage:
  aspelllint [-i <pattern>]... [<file>]...
  aspelllint -v | --version
  aspelllint -h | --help

Arguments:
  <file>                 Filename, or - for stdin [default: -]

Options:
  -i --ignore <pattern>  Ignore file pattern (fnmatch)
  -v --version           Print version info
  -h --help              Print usage info
DOCOPT

module Aspelllint
  def self.main
    ignores = DEFAULT_IGNORES

    begin
      options = Docopt::docopt(USAGE, version: Aspelllint::VERSION)

      require 'pp'
      pp options

      if options['--ignore']
        ignores = ignores.concat(options['--ignore'])
      end

      filenames = options['<file>']

      dotsmack = Dotsmack::Smacker.new(
        dotignore = '.aspelllintignore',
        additional_ignores = ignores
      )

      dotsmack.enumerate(filenames).each do |filename, _|
        begin
          if filename == '-'
            Aspelllint::check_stdin
          else
            Aspelllint::check(filename)
          end
        #
        # Invalid byte sequence in UTF-8 file.
        # Likely a false positive text file.
        #
        rescue ArgumentError
          nil
        end
      end
    rescue Docopt::Exit => e
      puts e.message
    end
  end
end
