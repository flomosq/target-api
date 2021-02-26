module Helpers
  def json
    JSON.parse(response.body).with_indifferent_access
  end

  def create_auth_headers
    user.create_new_auth_token
  end
end
