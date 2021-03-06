require 'helper'

describe '.execute' do
  before :each do
    ARGV.clear
    Cukesparse.reset!
  end

  context "when run with no arguments" do
    it "should display a cukesparse information message" do
      Cukesparse.should_receive("puts").with("Cukesparse - a simple command line parser to pass arguments into Cucumber!".yellow)
      Cukesparse.execute
    end
  end

  context "when run with the tasks argument" do
    it "should display the tasks within the config file" do
      Cukesparse.config_file = File.join(fixture_path, 'valid_tasks.yml')
      ARGV.push('tasks')
      Cukesparse.should_receive("puts").with("You have the following tasks within your config file: test_task, test_task1, cucumber_default_unknown, no_defaults".yellow)
      Cukesparse.execute
    end
  end
end