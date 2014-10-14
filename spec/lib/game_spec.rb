require "game"
require "spec_helper"

describe Game do
	describe "#roll(pins)" do
		it "Check Normal Roll" do
			game = Game.new()
			state = game.roll(5)
			expect(state).to eq("NORMAL")
		end

		it "Check Spare Roll" do
			game = Game.new()
			state = game.roll(5)
			state = game.roll(5)
			expect(state).to eq("SPARE")
		end

		it "Check Strike Roll" do
			game = Game.new()
			state = game.roll(10)
			expect(state).to eq("STRIKE")
		end
	end

	describe "## Test Run ##" do
		it "Check random case roll score = 127" do
			game = Game.new()
			game.roll(0)
			game.roll(7)
			game.roll(2)
			game.roll(6)
			game.roll(4)
			game.roll(5)
			game.roll(2)
			game.roll(7)
			game.roll(3)
			game.roll(7)
			game.roll(4)
			game.roll(6)
			game.roll(10)
			game.roll(5)
			game.roll(5)
			game.roll(3)
			game.roll(7)
			game.roll(8)
			game.roll(1)
			total_score = game.score()
			expect(total_score).to eq(127)
		end

		it "Check all spare with 5 pin down on every first hit with one extra throw when done" do
			game = Game.new()
			for i in 1..23
				game.roll(5)
			end
			total_score = game.score()
			expect(total_score).to eq(150)
		end

		it "Check hit with all 1 pin down 23 times of roll" do
			game = Game.new()
			for i in 1..23
				game.roll(1)
			end
			total_score = game.score()
			expect(total_score).to eq(20)
		end


		it "Check all strike with exceed by 100 roll" do
			game = Game.new()
			for i in 1..100
				game.roll(10)
			end
			total_score = game.score()
			expect(total_score).to eq(300)
		end

		it "Check all strike" do
			game = Game.new()
			for i in 1..22
				game.roll(10)
			end
			total_score = game.score()
			expect(total_score).to eq(300)
		end

	end
end