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

  describe "#take_slot" do
    it "marks board" do
      expect(tictactoe.print).to eq [
        "...",
        "...",
        "...",
      ].join("\n")

      # Marks X @ 0,0
      expect(tictactoe.take_slot(true, 0, 0)).to eq true

      expect(tictactoe.print).to eq [
        "X..",
        "...",
        "...",
      ].join("\n")

      # Marks O @ 1,2
      expect(tictactoe.take_slot(false, 1, 2)).to eq true
      expect(tictactoe.print).to eq [
        "X..",
        "..O",
        "...",
      ].join("\n")

      # Invalid mark if already exists
      expect(tictactoe.take_slot(true, 1, 2)).to eq false
      expect(tictactoe.print).to eq [
        "X..",
        "..O",
        "...",
      ].join("\n")
    end
  end

  describe "#get_winner" do

  end
end
