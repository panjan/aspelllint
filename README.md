# aspelllint - spell check for large projects

# HOMEPAGE

https://github.com/mcandre/aspelllint

# ABOUT

aspelllint scans large projects for spelling errors, reporting any misspelled or unidentified words found.

aspelllint is a shell wrapper around the traditional GNU [aspell](http://aspell.net/) backend, presenting a frontend similar to modern linters like [Reek](https://github.com/troessner/reek/wiki) and [JSHint](http://jshint.com/).

* Recursive file search by default
* Optional ignore patterns
* Install via a standard programming language package manager

# EXAMPLES

```
$ cat examples/nested/memo.md
Announcing Casual Fribsday!

$ cat examples/toy-boats.txt
I like toy baots.

$ aspelllint examples/
examples/nested/memo.md:18:18 Fribsday: FreeBSD, Frosty, Froissart, Frost, Freebased, Fireside, Freest, Frizzed, Robust, Forest, Fairest, Arabist, Forebode, Forebodes, Freebase, Foreboded, Fieriest, Furriest
examples/toy-boats.txt:46:11 baots: boats, baits, bats, bots, bahts, boots, boat's, bait's, Bates, bat's, bates, beats, bits, bouts, Bootes, baht's, beauts, boot's, bets, bods, buts, blots, bad's, bards, bauds, bawds, beets, butts, beat's, bit's, bout's, beaut's, booty's, Batu's, bet's, bod's, Baotou's, bast's, blot's, Bert's, Burt's, bard's, baud's, bawd's, beet's, butt's

$ aspelllint -i ".*.md" examples/
examples/toy-boats.txt:46:11 baots: boats, baits, bats, bots, bahts, boots, boat's, bait's, Bates, bat's, bates, beats, bits, bouts, Bootes, baht's, beauts, boot's, bets, bods, buts, blots, bad's, bards, bauds, bawds, beets, butts, beat's, bit's, bout's, beaut's, booty's, Batu's, bet's, bod's, Baotou's, bast's, blot's, Bert's, Burt's, bard's, baud's, bawd's, beet's, butt's

$ aspelllint -i ".*.md" -i ".*.txt" examples/

$ aspelllint -h
Usage: aspelllint [options] [<files>]
-i, --ignore pattern             Ignore file names matching Ruby regex pattern
-h, --help                       Print usage info
-v, --version                    Print version info
```

# REQUIREMENTS

* [Ruby](https://www.ruby-lang.org/) 2+
* [aspell](http://aspell.net/)

E.g., Mac users can `brew install aspell`.

# INSTALL

Install via [RubyGems](http://rubygems.org/):

```
$ gem install aspelllint
```

# LICENSE

FreeBSD
