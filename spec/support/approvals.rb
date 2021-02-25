require 'approvals/rspec'

RSpec.configure do |config|

  Approvals.configure do |config|
    config.approvals_path = 'spec/fixtures/approvals/'

    config.excluded_json_keys = {
      id: /(\A|_)id$/,
      sequence: /\A(email|uid)$/,
    }
  end

end
