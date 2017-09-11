require "ostruct"
require "rezult/version"

class Rezult < OpenStruct

  ERROR_MESSAGE_JOINER = "\n"

  attr_reader :error_messages

  def initialize(success:, data: {}, error_messages: [])
    super(data)
    @success = success
    @error_messages = [*error_messages]
  end

  def self.success(data = {})
    new(success: true, data: data)
  end

  def self.fail(error_messages = [])
    new(success: false, error_messages: [*error_messages])
  end

  def success?
    @success
  end

  def failed?
    !success?
  end

  def error_message
    error_messages.join(ERROR_MESSAGE_JOINER)
  end

end
