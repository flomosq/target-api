module Helpers
  def json
    JSON.parse(response.body).with_indifferent_access
  end

  def auth_headers(user)
    @auth_headers ||= user.create_new_auth_token
  end

  def file_body(filename)
    {
      data: "data:image/png;base64,#{encode_base64(filename)}",
      filename: filename,
      content_type: 'image/png'
    }
  end

  private

  def open_file(filename)
    File.open(
      File.expand_path(
        Rails.root.join('spec', 'fixtures', filename)
      )
    ).read
  end

  def encode_base64(filename)
    file = open_file(filename)
    Base64.encode64(file)
  end
end
