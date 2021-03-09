ActiveAdmin.register User do
  actions :index, :show

  index do
    id_column
    column :email
    column :gender
    column :provider
    column :confirmed_at
    actions
  end

  filter :email
  filter :gender, as: :select, collection: User.genders

  show title: :email do
    attributes_table do
      row :email
      row :gender
      row :provider
      row :confirmed_at
      row :uid
      row :created_at
      row :updated_at
    end
  end
end
