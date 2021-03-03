module Validators
  class TargetLimitPerUserValidator < ActiveModel::Validator
    MAX_TARGET_AMOUNT_PER_USER = 10

    def validate(record)
      return unless record.user
      return if record.user.targets.count < MAX_TARGET_AMOUNT_PER_USER

      record.errors.add(:targets,
                        I18n.t('models.target.errors.targets_per_user_limit',
                               limit: MAX_TARGET_AMOUNT_PER_USER))
    end
  end
end
