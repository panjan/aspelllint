Given(/^the program has finished$/) do
  @cucumber = `aspelllint examples/`
end

Then(/^the output is correct for each test$/) do
  lines = @cucumber.split("\n")

  lines.length.should == 2

  lines[0].should == "examples/nested/memo.md:18:20 Fribsday: FreeBSD, Frosty, Froissart, Frost, Freebased, Fireside, Freest, Frizzed, Robust, Forest, Fairest, Arabist, Forebode, Forebodes, Freebase, Foreboded, Fieriest, Furriest"
  lines[1].should == "examples/toy-boats.txt:46:11 baots: boats, baits, bats, bots, bahts, boots, boat's, bait's, Bates, bat's, bates, beats, bits, bouts, Bootes, baht's, beauts, boot's, bets, bods, buts, blots, bad's, bards, bauds, bawds, beets, butts, beat's, bit's, bout's, beaut's, booty's, Batu's, bet's, bod's, Baotou's, bast's, blot's, Bert's, Burt's, bard's, baud's, bawd's, beet's, butt's"
end
