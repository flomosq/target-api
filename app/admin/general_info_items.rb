ActiveAdmin.register GeneralInfoItem do
  permit_params :name, :content

  index do
    selectable_column
    id_column
    column :name
    column :content
    actions
  end

  filter :name
end
