require "frame"
require "spec_helper"

describe Frame do
	describe "#hit(number)" do
		it "Test hit on NORMAL Condition" do
			frame = Frame.new()
			state = frame.hit(5)
			expect(state).to eq("NORMAL")
		end
		it "Test hit on SPARE Condition" do
			frame = Frame.new()
			frame.hit(5)
			state = frame.hit(5)
			expect(state).to eq("SPARE")
		end

		it "Test hit on STRIKE Condition" do
			frame = Frame.new()
			state = frame.hit(10)
			expect(state).to eq("STRIKE")
		end
	end

	describe "#setfalling_pin(number)" do
		it "Test return Pin when set" do
			frame = Frame.new()
			falling_pin = frame.setfalling_pin(5)
			expect(falling_pin).to eq(5)
		end
	end


	describe "#setBonus(number)" do
		it "Test when set bonus to 2 without tenth frame" do
			frame = Frame.new()
			bonus = frame.setBonus(2)
			expect(bonus).to eq(2)
		end

		it "Test when set bonus to 2 with tenth frame" do
			frame = Frame.new()
			frame.tenthFrameActivate()
			bonus = frame.setBonus(2)
			expect(bonus).to eq(0)
		end
	end

	describe "#addBonusScore(number)" do
		it "Test when bonus = 1" do
			frame = Frame.new()
			frame.setBonus(1)
			bonus = frame.addBonusScore(5)
			expect(bonus).to eq(5)
		end

		it "Test when bonus = 0" do
			frame = Frame.new()
			frame.setBonus(0)
			bonus = frame.addBonusScore(5)
			expect(bonus).to eq(0)
		end
	end


	describe "#getScore() and #addScore(number)" do
		it "Test getScore from new Frame" do
			frame = Frame.new()
			score = frame.getScore()
			expect(score).to eq(0)
		end

		it "Test addScore by 5" do
			frame = Frame.new()
			frame.addScore(5)
			score = frame.getScore()
			expect(score).to eq(5)
		end
	end

	describe "#resetPin" do
		it "Test hit 5 then reset pin 1 time check by STRIKE on next hit" do
			frame = Frame.new()
			frame.hit(5)
			frame.resetPin()
			state = frame.hit(10)
			expect(state).to eq("STRIKE")
		end

		it "Test hit 5 then reset pin 1 time check by END hit on next hit" do
			frame = Frame.new()
			frame.hit(5)
			frame.resetPin()
			state = frame.hit(6)
			expect(state).to eq("END")
		end

	end
end