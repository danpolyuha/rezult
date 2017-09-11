require "spec_helper"

RSpec.describe Rezult do

  describe ".success" do
    let(:result) { described_class.success }

    it "succeeds" do
      expect(result.success?).to be_truthy
    end

    it "doesn't fail" do
      expect(result.failed?).to be_falsey
    end
  end

  describe ".fail" do
    let(:result) { described_class.fail }

    it "doesn't succeed" do
      expect(result.success?).to be_falsey
    end

    it "fails" do
      expect(result.failed?).to be_truthy
    end
  end

  describe "resulting data" do
    let(:key1) { :number }
    let(:value1) { 5 }
    let(:key2) { :string }
    let(:value2) { 'blabla' }
    let(:result) { described_class.success(key1 => value1, key2 => value2) }

    it "returns correct values" do
      expect(result.send(key1)).to eq(value1)
      expect(result.send(key2)).to eq(value2)
    end

    it "returns nil for not existing keys" do
      expect(result.send(:blabla)).to be_nil
    end
  end

  context "when single message provided" do
    let(:error_message) { "some error" }
    let(:result) { described_class.fail(error_message) }

    it "has correct 'error_message'" do
      expect(result.error_message).to eq(error_message)
    end

    it "has correct 'error_messages'" do
      expect(result.error_messages).to match_array([error_message])
    end
  end

  context "when several messages provided" do
    let(:error_messages) { ["some error", "another error"] }
    let(:result) { described_class.fail(error_messages) }

    it "has correct 'error_message'" do
      expect(result.error_message).to eq("some error\nanother error")
    end

    it "has correct 'error_messages'" do
      expect(result.error_messages).to match_array(error_messages)
    end
  end

end
