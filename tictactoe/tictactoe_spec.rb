require "rspec"
require "./tictactoe.rb"

RSpec.describe Tictactoe do
  subject(:tictactoe) { Tictactoe.new }

  describe "#print" do
    subject { tictactoe.print }

    it "returns blank board" do
      is_expected.to eq [
        "...",
        "...",
        "...",
      ].join("\n")
    end
  end
end
