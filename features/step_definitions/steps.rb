Given(/^the program has finished$/) do
  @cucumber = `aspelllint examples/`
end

Then(/^the output is correct for each test$/) do
  lines = @cucumber.split("\n")

  expect(lines.length).to eq(2)

  expect(lines[0]).to match(
    %r(^examples/nested/memo\.md\:17\:20\sFribsday\:\s(.+,\s)+.+$)
  )
  expect(lines[1]).to match(
    %r(^examples/toy-boats\.txt\:46\:11\sbaots\:\s(.+,\s)+.+$)
  )
end
