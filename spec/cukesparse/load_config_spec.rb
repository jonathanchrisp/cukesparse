require 'helper'

describe '.load_config' do
  before :each do
    ARGV.clear
    Cukesparse.reset!
  end

  context "when run with incorrect task file" do
    it "will return an error if the task file fails to parse" do
      Cukesparse.config_file = File.join(fixture_path, 'invalid_tasks.yml')
      Cukesparse.should_receive("abort").with("Your tasks file did not parse as expected!".red.underline)
      Cukesparse.load_config
    end
  end

  context "when run with task file missing" do
    it "will return an error if the task file is missing" do
      Cukesparse.config_file = File.join(fixture_path, 'missing_tasks.yml')
      Cukesparse.should_receive("abort").with("Your tasks file is missing!".red.underline)
      Cukesparse.load_config
    end
  end
end