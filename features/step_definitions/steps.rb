Given(/^the program has finished$/) do
  @cucumber = `aspelllint examples/`
  @cucumber_ignores = `aspelllint -i '*.md' examples/`
  @cucumber_stdin = `cat examples/toy-boats.txt | aspelllint`
end

Then(/^the output is correct for each test$/) do
  cucumber_lines = @cucumber.split("\n")
  expect(cucumber_lines.length).to eq(2)
  expect(cucumber_lines[0]).to match(%r(^examples/nested/memo\.md\:.+Fribsday.+$))
  expect(cucumber_lines[1]).to match(%r(^examples/toy-boats\.txt\:.+baots.+$))

  cucumber_ignores = @cucumber_ignores.split("\n")
  expect(cucumber_ignores.length).to eq(1)
  expect(cucumber_ignores[0]).to match(%r(^examples/toy-boats\.txt\:.+baots.+$))

  cucumber_lines_stdin = @cucumber_stdin.split("\n")
  expect(cucumber_lines_stdin.length).to eq(1)
  expect(cucumber_lines_stdin[0]).to match(%r(^stdin\:.+baots.+$))
end
