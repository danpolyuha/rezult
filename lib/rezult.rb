require "ostruct"
require "rezult/version"

class Rezult < OpenStruct

  attr_accessor :error_messages

  def initialize(success, data, error_messages)
    super(data)
    @success = success
    @error_messages = Array(error_messages)
  end

  def self.success(data = {})
    new(true, data, [])
  end

  def self.fail(error_messages = [])
    new(false, {}, error_messages)
  end

  def success?
    @success
  end

end
