require "rspec"
require "./tictactoe.rb"

RSpec.describe Tictactoe do
  subject(:tictactoe) { Tictactoe.new }

  describe "#new" do
    subject(:tictactoe) { Tictactoe.new(board) }

    let(:board) do
      [nil, nil, nil, "X", "O", "X", nil, nil, nil]
    end

    it "can set whole board from array" do
      subject

      expect(tictactoe.board).to eq [
        nil, nil, nil, "X", "O", "X", nil, nil, nil
      ]

      expect(tictactoe.print).to eq [
        "...",
        "XOX",
        "...",
      ].join("\n")
    end
  end

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
    it "returns nil if no winner" do
      tictactoe.board = [nil] * 9
      expect(tictactoe.get_winner).to be_nil
    end

    it "returns X when get 3 Xs in a row" do
      # Role
      tictactoe.board = [
        "X", "X", "X",
        nil, nil, nil,
        nil, nil, nil,
      ]

      expect(tictactoe.get_winner).to eq "X"

      # Column
      tictactoe.board = [
        nil, "X", nil,
        nil, "X", nil,
        nil, "X", nil,
      ]

      expect(tictactoe.get_winner).to eq "X"

      # Across \
      tictactoe.board = [
        "X", nil, nil,
        nil, "X", nil,
        nil, nil, "X",
      ]

      expect(tictactoe.get_winner).to eq "X"

      # Across /
      tictactoe.board = [
        nil, nil, "X",
        nil, "X", nil,
        "X", nil, nil,
      ]

      expect(tictactoe.get_winner).to eq "X"
    end
  end
end
