Given(/^the program has finished$/) do
  @cucumber = `aspelllint examples/`
  @cucumber_stdin = `cat examples/toy-boats.txt | aspelllint`
end

Then(/^the output is correct for each test$/) do
  lines = @cucumber.split("\n")

  expect(lines.length).to eq(2)

  expect(lines[0]).to match(
    %r(^examples/nested/memo\.md\:.+Fribsday.+$)
  )
  expect(lines[1]).to match(
    %r(^examples/toy-boats\.txt\:.+baots.+$)
  )

  lines_stdin = @cucumber_stdin.split("\n")

  expect(lines_stdin.length).to eq(1)

  expect(lines_stdin[0]).to match(
    %r(^stdin\:.+baots.+$)
  )
end
