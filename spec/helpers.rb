module Helpers
  def json
    JSON.parse(response.body).with_indifferent_access
  end

  def auth_headers
    @auth_headers ||= user.create_new_auth_token
  end

  def refresh_auth_headers
    @auth_headers = user.create_new_auth_token
  end
end
