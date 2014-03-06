Given(/^the program has finished$/) do
  @cucumber = `aspelllint examples/`
end

Then(/^the output is correct for each test$/) do
  lines = @cucumber.split("\n")

  lines.length.should == 2

  lines[0].should =~ %r(^examples/nested/memo\.md\:18\:20\sFribsday\:\s(.+,\s)+.+$)
  lines[1].should =~ %r(^examples/toy-boats\.txt\:46\:11\sbaots\:\s(.+,\s)+.+$)
end
