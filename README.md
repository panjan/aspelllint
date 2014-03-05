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
$ cat examples/toy-boats.txt
I like toy baots.

$ aspelllint examples/
examples/toy-boats.txt:46:11 baots: boats, baits, bats, bots, bahts, boots, boat's, bait's, Bates, bat's, bates, beats, bits, bouts, Bootes, baht's, beauts, boot's, bets, bods, buts, blots, bad's, bards, bauds, bawds, beets, butts, beat's, bit's, bout's, beaut's, booty's, Batu's, bet's, bod's, Baotou's, bast's, blot's, Bert's, Burt's, bard's, baud's, bawd's, beet's, butt's

$ aspelllint
./aspelllint.gemspec:32:20 ptools: pools, tools, stools, poodles, pool's, toils, tool's, petals, pols, patrols, prowls, stool's, polls, tolls, retools, atolls, toil's, poodle's, pedals, Patel's, petal's, pol's, Polo's, polo's, patrol's, petrol's, Poole's, prowl's, poll's, toll's, atoll's, pedal's
./bin/aspelllint:16:9 optparse: opt parse, opt-parse, outpace, potpies, opiates, opts, uptakes, optics, potpie's, optic's, epitaphs, optimize, optics's, opiate's, uptake's, epitaph's
./bin/aspelllint:11:11 OptionParser: Option Parser, Option-Parser, Options, Option's, Optional, Optioned, Optionally, Option, Opticians, Optioning, Optician's
./bin/aspelllint:53:68 regex: reg ex, reg-ex, regexp, Rex, rages, recce, reeks, reg, regrew, Roeg's, Rogers, rage, rage's, reek, ridges, rogers, rogues, rouges, rags, rigs, roux, rugs, Regor, Roger, Rolex, relax, remix, resew, roger, Reggie's, Regor's, Reyes, Rigel, Roget, raged, regal, reggae's, veges, Riggs, rag's, ragas, rakes, rec's, rig's, rug's, ridge's, rogue's, rouge's, reek's, Rene's, Riga's, raga's, rake's
./lib/aspelllint.rb:32:9 ptools: pools, tools, stools, poodles, pool's, toils, tool's, petals, pols, patrols, prowls, stool's, polls, tolls, retools, atolls, toil's, poodle's, pedals, Patel's, petal's, pol's, Polo's, polo's, patrol's, petrol's, Poole's, prowl's, poll's, toll's, atoll's, pedal's

$ aspelllint -h
Usage: aspelllint [options] [<files>]
-i, --ignore pattern             Ignore files matching Ruby regex pattern
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
