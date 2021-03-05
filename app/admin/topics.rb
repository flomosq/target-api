ActiveAdmin.register Topic do
  permit_params :name

  filter :name
end
