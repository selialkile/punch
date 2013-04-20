# -*- encoding : utf-8 -*-
module Punch
  # Custom error class for rescuing from all Punch errors
  class Error < StandardError; end

  class InvalidLogin < Error; end
end