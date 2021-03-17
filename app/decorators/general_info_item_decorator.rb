class GeneralInfoItemDecorator < Draper::Decorator
  delegate_all

  def content_preview
    content.truncate(30)
  end
end
