require "ostruct"
require "rezult/version"

class Rezult < OpenStruct

  attr_accessor :error_message

  def initialize(success, data, error_message)
    super(data)
    @success = success
    @error_message = error_message
  end

  def self.success(data = {})
    new(true, data, [])
  end

  def self.fail(error_message = nil)
    new(false, {}, error_message)
  end

  def success?
    @success
  end

  def failed?
    !@success
  end

end
