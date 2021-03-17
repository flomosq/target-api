ActiveAdmin.register GeneralInfoItem do
  decorate_with GeneralInfoItemDecorator

  permit_params :name, :content

  index do
    selectable_column
    id_column
    column :name
    column :content_preview
    actions
  end

  filter :name
end
