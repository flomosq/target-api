module Validators
  class EmailValidator < ActiveModel::EachValidator
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze
    def validate_each(record, attribute, value)
      return if value =~ EMAIL_REGEX

      record.errors.add attribute, (options[:message] || 'is not an email')
    end
  end
end
