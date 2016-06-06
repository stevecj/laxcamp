class Communicator < ApplicationRecord
  NOT_ALPHA_DIGIT_UNDERSCORE_PERIOD_OR_DASH = /[^\p{L}\d_.-]/

  validates_presence_of :handle, :full_name

  validate :must_have_only_acceptable_handle_chars

  def handle=(value)
    super value.strip
  end

  def full_name=(value)
    super value.strip
  end

  def must_have_only_acceptable_handle_chars
    if handle.present? && handle =~ NOT_ALPHA_DIGIT_UNDERSCORE_PERIOD_OR_DASH
      errors.add(:handle, :has_invalid_char)
    end
  end
end
