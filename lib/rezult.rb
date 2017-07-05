require "ostruct"
require "rezult/version"

class Rezult < OpenStruct

  attr_reader :error_message

  def initialize(success:, data: {}, error_message: nil)
    super(data)
    @success = success
    @error_message = error_message
  end

  def self.success(data = {})
    new(success: true, data: data)
  end

  def self.fail(error_message = nil)
    new(success: false, error_message: error_message)
  end

  def success?
    @success
  end

  def failed?
    !success?
  end

end
