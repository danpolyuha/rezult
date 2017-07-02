require "spec_helper"

RSpec.describe Rezult do

  describe ".success" do
    it 'returns success' do
      result = Rezult.success
      expect(result.success?).to be_truthy
    end
  end

  describe ".fail" do
    it 'returns failure' do
      result = Rezult.fail
      expect(result.success?).to be_falsey
    end
  end

  describe "#[]" do
    let(:key1) { :number }
    let(:value1) { 5 }
    let(:key2) { :string }
    let(:value2) { 'blabla' }
    let(:result) { Rezult.success(key1 => value1, key2 => value2) }

    it "returns correct values" do
      expect(result[key1]).to eq(value1)
      expect(result[key2]).to eq(value2)
    end

    it "is nil for not existing keys" do
      expect(result[:blabla]).to be_nil
    end
  end

  describe "#error_messages" do
    let(:result) { Rezult.fail(error_messages) }

    context "when one error message provided" do
      let(:error_messages) { "some error" }

      it "has one error message in 'error_messages'" do
        expect(result.error_messages).to eq([error_messages])
      end
    end

    context "when several error messages provided" do
      let(:error_messages) { ["some error 01", "some error 02"] }

      it "fails" do
        expect(result.success?).to be_falsy
      end

      it "has one error message in 'error_messages'" do
        expect(result.error_messages).to match_array(error_messages)
      end
    end

  end

end
